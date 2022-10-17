#include "named_event.h"

#include <stdexcept>

#include "utils.h"

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
  RegisterWaitForSingleObject(&waitHandle, event, &CallbackForWait, this,
                              INFINITE,
                              WT_EXECUTEONLYONCE | WT_EXECUTEINWAITTHREAD);
}

NamedEvent::NamedEvent(std::string name, std::function<void()> callback)
    : callback{std::move(callback)} {
  event = OpenEvent(EVENT_MODIFY_STATE | SYNCHRONIZE, TRUE,
                    Utf16FromUtf8(name).c_str());

  if (event == nullptr || event == INVALID_HANDLE_VALUE) {
    // the most likely error
    if (GetLastError() == ERROR_FILE_NOT_FOUND) {
      throw std::invalid_argument("Event never created");
    } else {
      throw std::runtime_error("Cannot open event");
    }
  }
  if (!RegisterWaitForSingleObject(
          &waitHandle, event, &CallbackForWait, this, INFINITE,
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
