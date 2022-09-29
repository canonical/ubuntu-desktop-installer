#include "flutter_window.h"

#include <flutter/standard_method_codec.h>

#include <optional>

#include "flutter/generated_plugin_registrant.h"
#include "named_event.h"
#include "utils.h"

namespace ChannelConstants {
const char* channel = "ubuntuWslSetupChannel";
const char* onEventSet = "onEventSet";
const char* addListenerFor = "addListenerFor";
};  // namespace ChannelConstants

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());
  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  // method channel setup
  ubuntuWslSetupChannel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          flutter_controller_->engine()->messenger(), ChannelConstants::channel,
          &flutter::StandardMethodCodec::GetInstance());

  ubuntuWslSetupChannel->SetMethodCallHandler(
      [self = this](const auto& call, auto result) {
        self->handleMethodCall(call, std::move(result));
      });

  return true;
}

void FlutterWindow::onEventSet(const std::string& eventName) {
  if (ubuntuWslSetupChannel == nullptr) {
    return;
  }
  ubuntuWslSetupChannel->InvokeMethod(
      ChannelConstants::onEventSet,
      std::make_unique<flutter::EncodableValue>(eventName));
}

void FlutterWindow::handleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue>& call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (call.method_name().compare(ChannelConstants::addListenerFor) == 0) {
    auto* arg = call.arguments();
    if (arg == nullptr) {
      result->Error(ChannelConstants::channel, "The event name is required");
      return;
    }
    auto* eventNamePtr = std::get_if<std::string>(arg);
    if (eventNamePtr == nullptr) {
      result->Error(ChannelConstants::channel,
                    "The event name is the only argument accepted.");
      return;
    }

    try {
      // emplace_back promises to preserve the vector as is if an exception is
      // thrown during object in-place construction. Here it means platform or
      // argument failure.
      events.emplace_back(*eventNamePtr,
                          [self = this, eventName = *eventNamePtr]() {
                            self->onEventSet(eventName);
                          });
      result->Success();
    } catch (const std::runtime_error& e) {
      result->Error(ChannelConstants::channel, e.what());
    } catch (const std::invalid_argument& e) {
      std::string msg{e.what()};
      msg.append(": ");
      msg.append(*eventNamePtr);
      result->Error(ChannelConstants::channel, msg);
    }

  } else {
    result->NotImplemented();
  }
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
