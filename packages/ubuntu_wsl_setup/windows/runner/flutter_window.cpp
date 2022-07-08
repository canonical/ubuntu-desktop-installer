#include "flutter_window.h"

#include <optional>
#include <stdexcept>

#include "flutter/generated_plugin_registrant.h"
#include "flutter/standard_method_codec.h"
#include "utils.h"

namespace NamedEventConstants {
const char* channel = "ubuntuWslSetupChannel";
const char* onEventSet = "onEventSet";
const char* addListenerFor = "addListenerFor";
const char* argKey = "eventName";
};  // namespace NamedEventConstants

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
          flutter_controller_->engine()->messenger(),
          NamedEventConstants::channel,
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
  flutter::EncodableMap args = flutter::EncodableMap();
  args[std::string(NamedEventConstants::argKey)] = eventName;
  ubuntuWslSetupChannel->InvokeMethod(
      NamedEventConstants::onEventSet,
      std::make_unique<flutter::EncodableValue>(args));
}

void FlutterWindow::handleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue>& call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (call.method_name().compare(NamedEventConstants::addListenerFor) == 0) {
    auto* arg = call.arguments();
    if (arg == nullptr) {
      result->Error(NamedEventConstants::channel, "The event name is required");
      return;
    }
    auto* eventNamePtr = std::get_if<std::string>(arg);
    if (eventNamePtr == nullptr) {
      result->Error(NamedEventConstants::channel,
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
    } catch (const std::runtime_error& e) {
      result->Error(NamedEventConstants::channel, e.what());
    } catch (const std::invalid_argument& e) {
      std::string msg{e.what()};
      msg.append(". Wass the event ever created?");
      result->Error(NamedEventConstants::channel, msg);
    }

    result->Success();
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

VOID NamedEvent::CallbackForWait(PVOID context, BOOLEAN) {
  // If the callback is called, the object and its handles are alive.
  auto* self = reinterpret_cast<NamedEvent*>(context);
  [[maybe_unused]] auto res = UnregisterWait(self->waitHandle);
  self->waitHandle = nullptr;
  self->callback();
}

// The moved-from object [other] is left in a known state:
// handles are nullptrs and the previous `wait` is unregistered.
NamedEvent::NamedEvent(NamedEvent&& other) noexcept
    : callback{std::move(other.callback)},
      event{std::exchange(other.event, nullptr)},
      waitHandle{nullptr} {
  // preserving the existing callback setup would crash because the (this)
  // pointer set as context for the callback would be dangling at this point.
  if (other.waitHandle != nullptr) {
    [[maybe_unused]] auto res = UnregisterWait(other.waitHandle);
    other.waitHandle = nullptr;
  }
  RegisterWaitForSingleObject(&waitHandle, event, &CallbackForWait,
                              reinterpret_cast<void*>(this), INFINITE,
                              WT_EXECUTEONLYONCE | WT_EXECUTEINWAITTHREAD);
}

NamedEvent::NamedEvent(std::string name, std::function<void()> callback)
    : callback{std::move(callback)} {
  event = OpenEvent(EVENT_MODIFY_STATE | SYNCHRONIZE, TRUE,
                    Utf16FromUtf8(name).c_str());

  if (event == nullptr || event == INVALID_HANDLE_VALUE) {
    // the most likely error
    if (GetLastError() == ERROR_FILE_NOT_FOUND) {
      throw std::invalid_argument(name);
    } else {
      throw std::runtime_error("Cannot open event");
    }
  }
  if (FALSE == RegisterWaitForSingleObject(
                   &waitHandle, event, &CallbackForWait,
                   reinterpret_cast<void*>(this), INFINITE,
                   WT_EXECUTEONLYONCE | WT_EXECUTEINWAITTHREAD)) {
    // rollback
    CloseHandle(event);
    throw std::runtime_error("Cannot subscribe to the event");
  }
}

NamedEvent::~NamedEvent() noexcept {
  if (waitHandle != nullptr) {
    [[maybe_unused]] auto res = UnregisterWait(waitHandle);
    // Win32 Docs: Note that a wait handle cannot be used in functions that
    // require an object handle, such as CloseHandle.
  }

  if (event != nullptr) {
    CloseHandle(event);
  }
}
