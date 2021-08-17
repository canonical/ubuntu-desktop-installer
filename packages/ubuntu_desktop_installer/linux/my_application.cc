#include "my_application.h"

#include <flutter_linux/flutter_linux.h>

#include "flutter/generated_plugin_registrant.h"

struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

static gboolean on_delete_event(GtkWidget* /*window*/, GdkEvent* /*event*/,
                                gpointer user_data) {
  g_autoptr(GError) error = nullptr;
  FlValue* event = fl_value_new_string("deleteEvent");
  FlEventChannel* event_channel = FL_EVENT_CHANNEL(user_data);
  if (!fl_event_channel_send(event_channel, event, nullptr, &error)) {
    g_warning("delete-event: %s", error->message);
  }
  return FALSE;
}

static void on_channel_method(FlMethodChannel* channel,
                              FlMethodCall* method_call, gpointer user_data) {
  GtkWindow* window = GTK_WINDOW(user_data);
  g_autoptr(FlMethodResponse) response = nullptr;
  if (strcmp(fl_method_call_get_name(method_call), "setWindowTitle") == 0) {
    FlValue* args = fl_method_call_get_args(method_call);
    FlValue* title = fl_value_get_list_value(args, 0);
    GtkHeaderBar* header_bar = GTK_HEADER_BAR(gtk_window_get_titlebar(window));
    gtk_header_bar_set_title(header_bar, fl_value_get_string(title));
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (strcmp(fl_method_call_get_name(method_call), "closeWindow") == 0) {
    gtk_window_close(window);
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else {
    response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  }

  g_autoptr(GError) error = NULL;
  if (!fl_method_call_respond(method_call, response, &error))
    g_warning("on_channel_method: %s", error->message);
}

// Implements GApplication::activate.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);
  GtkWindow* window =
      GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(application)));
  GtkHeaderBar* header_bar = GTK_HEADER_BAR(gtk_header_bar_new());
  gtk_widget_show(GTK_WIDGET(header_bar));
  gtk_header_bar_set_show_close_button(header_bar, TRUE);
  gtk_header_bar_set_decoration_layout(header_bar, ":close");
  gtk_window_set_titlebar(window, GTK_WIDGET(header_bar));
  gtk_window_set_default_size(window, 960, 680);
  gtk_widget_show(GTK_WIDGET(window));

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(
      project, self->dart_entrypoint_arguments);

  FlView* view = fl_view_new(project);
  gtk_widget_show(GTK_WIDGET(view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));

  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

  FlEngine* engine = fl_view_get_engine(view);
  FlBinaryMessenger* messenger = fl_engine_get_binary_messenger(engine);
  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();

  g_autoptr(FlEventChannel) event_channel = fl_event_channel_new(
      messenger, "ubuntu-desktop-installer/events", FL_METHOD_CODEC(codec));
  g_signal_connect(G_OBJECT(window), "delete-event",
                   G_CALLBACK(on_delete_event), event_channel);

  g_autoptr(FlMethodChannel) method_channel = fl_method_channel_new(
      messenger, "ubuntu-desktop-installer", FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(method_channel, on_channel_method,
                                            window, nullptr);

  gtk_widget_grab_focus(GTK_WIDGET(view));
}

// Implements GApplication::local_command_line.
static gboolean my_application_local_command_line(GApplication* application,
                                                  gchar*** arguments,
                                                  int* exit_status) {
  MyApplication* self = MY_APPLICATION(application);
  // Strip out the first argument as it is the binary name.
  self->dart_entrypoint_arguments = g_strdupv(*arguments + 1);

  g_autoptr(GError) error = nullptr;
  if (!g_application_register(application, nullptr, &error)) {
    g_warning("Failed to register: %s", error->message);
    *exit_status = 1;
    return TRUE;
  }

  g_application_activate(application);
  *exit_status = 0;

  return TRUE;
}

// Implements GObject::dispose.
static void my_application_dispose(GObject* object) {
  MyApplication* self = MY_APPLICATION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  G_OBJECT_CLASS(my_application_parent_class)->dispose(object);
}

static void my_application_class_init(MyApplicationClass* klass) {
  G_APPLICATION_CLASS(klass)->activate = my_application_activate;
  G_APPLICATION_CLASS(klass)->local_command_line =
      my_application_local_command_line;
  G_OBJECT_CLASS(klass)->dispose = my_application_dispose;
}

static void my_application_init(MyApplication* self) {}

MyApplication* my_application_new() {
  return MY_APPLICATION(g_object_new(
      my_application_get_type(), "application-id", APPLICATION_ID, nullptr));
}
