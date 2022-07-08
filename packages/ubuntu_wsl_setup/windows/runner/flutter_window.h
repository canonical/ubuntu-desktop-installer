#ifndef RUNNER_FLUTTER_WINDOW_H_
#define RUNNER_FLUTTER_WINDOW_H_

#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <flutter/method_channel.h>

#include <memory>
#include <vector>

#include "win32_window.h"

class NamedEvent;
// A window that does nothing but host a Flutter view.
class FlutterWindow : public Win32Window {
 public:
  // Creates a new FlutterWindow hosting a Flutter view running |project|.
  explicit FlutterWindow(const flutter::DartProject& project);
  virtual ~FlutterWindow();

 protected:
  // Win32Window:
  bool OnCreate() override;
  void OnDestroy() override;
  LRESULT MessageHandler(HWND window, UINT const message, WPARAM const wparam,
                         LPARAM const lparam) noexcept override;

 private:
  // The project to run.
  flutter::DartProject project_;

  // The Flutter instance hosted by this window.
  std::unique_ptr<flutter::FlutterViewController> flutter_controller_;

  // Method channel to notify Dart code of interesting native events.
  std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>>
      ubuntuWslSetupChannel;

  // a collection of native named events we listen due request from Dart land.
  std::vector<NamedEvent> events;

  // Callback executed when a [NamedEvent] is fired to notify the Dart land that
  // the [eventNamed] fired.RegisterWaitForSingleObject
  void onEventSet(const std::string& eventName);

  // Handles the method calls coming from the Dart land.
  void handleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

#endif  // RUNNER_FLUTTER_WINDOW_H_
