#ifndef RUNNER_NAMED_EVENT_H_
#define RUNNER_NAMED_EVENT_H_

#include <windows.h>

#include <functional>
#include <string>

// A wrapper around the OpenEvent/RegisterWait Win32 API's setup for triggering
// only once which waits on another thread and executes the supplied [callback]
// once the event is first set.
class NamedEvent {
 public:
  NamedEvent(std::string name, std::function<void()> callback);
  NamedEvent(const NamedEvent& other) = delete;
  NamedEvent(NamedEvent&& other) noexcept;
  NamedEvent operator=(const NamedEvent& other) = delete;
  ~NamedEvent() noexcept;

 private:
  std::function<void()> callback;
  HANDLE event = nullptr;
  HANDLE waitHandle = nullptr;
  static VOID CALLBACK CallbackForWait(PVOID context, BOOLEAN);
};
#endif  //  RUNNER_NAMED_EVENT_H_
