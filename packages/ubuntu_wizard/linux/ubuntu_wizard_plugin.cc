#include "include/ubuntu_wizard/ubuntu_wizard_plugin.h"

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>
#include <sys/utsname.h>

#include <cstring>

#define UBUNTU_WIZARD_PLUGIN(obj)                                     \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), ubuntu_wizard_plugin_get_type(), \
                              UbuntuWizardPlugin))

struct _UbuntuWizardPlugin {
  GObject parent_instance;
};

G_DEFINE_TYPE(UbuntuWizardPlugin, ubuntu_wizard_plugin, g_object_get_type())

// Called when a method call is received from Flutter.
static void ubuntu_wizard_plugin_handle_method_call(
    FlPluginRegistrar* registrar, FlMethodCall* method_call) {
  g_autoptr(FlMethodResponse) response = nullptr;

  FlView* view = fl_plugin_registrar_get_view(registrar);
  GtkWidget* window = gtk_widget_get_toplevel(GTK_WIDGET(view));
  const gchar* method = fl_method_call_get_name(method_call);

  if (strcmp(method, "setWindowTitle") == 0) {
    FlValue* args = fl_method_call_get_args(method_call);
    FlValue* title = fl_value_get_list_value(args, 0);
    GtkWidget* titlebar = gtk_window_get_titlebar(GTK_WINDOW(window));
    gtk_header_bar_set_title(GTK_HEADER_BAR(titlebar),
                             fl_value_get_string(title));
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (strcmp(fl_method_call_get_name(method_call), "closeWindow") == 0) {
    gtk_window_close(GTK_WINDOW(window));
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else {
    response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  }

  fl_method_call_respond(method_call, response, nullptr);
}

static void ubuntu_wizard_plugin_dispose(GObject* object) {
  G_OBJECT_CLASS(ubuntu_wizard_plugin_parent_class)->dispose(object);
}

static void ubuntu_wizard_plugin_class_init(UbuntuWizardPluginClass* klass) {
  G_OBJECT_CLASS(klass)->dispose = ubuntu_wizard_plugin_dispose;
}

static void ubuntu_wizard_plugin_init(UbuntuWizardPlugin* self) {}

static void on_method_call(FlMethodChannel* channel, FlMethodCall* method_call,
                           gpointer user_data) {
  FlPluginRegistrar* registrar = FL_PLUGIN_REGISTRAR(user_data);
  ubuntu_wizard_plugin_handle_method_call(registrar, method_call);
}

static gboolean on_delete_event(GtkWidget* /*window*/, GdkEvent* /*event*/,
                                gpointer user_data) {
  g_autoptr(GError) error = nullptr;
  g_autoptr(FlValue) event = fl_value_new_string("deleteEvent");
  FlEventChannel* event_channel = FL_EVENT_CHANNEL(user_data);
  if (!fl_event_channel_send(event_channel, event, nullptr, &error)) {
    g_warning("delete-event: %s", error->message);
  }
  return FALSE;
}

void ubuntu_wizard_plugin_register_with_registrar(
    FlPluginRegistrar* registrar) {
  UbuntuWizardPlugin* plugin = UBUNTU_WIZARD_PLUGIN(
      g_object_new(ubuntu_wizard_plugin_get_type(), nullptr));

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_autoptr(FlMethodChannel) method_channel =
      fl_method_channel_new(fl_plugin_registrar_get_messenger(registrar),
                            "ubuntu_wizard", FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(
      method_channel, on_method_call, g_object_ref(registrar), g_object_unref);

  g_autoptr(FlEventChannel) event_channel =
      fl_event_channel_new(fl_plugin_registrar_get_messenger(registrar),
                           "ubuntu_wizard/events", FL_METHOD_CODEC(codec));

  FlView* view = fl_plugin_registrar_get_view(registrar);
  GtkWidget* window = gtk_widget_get_toplevel(GTK_WIDGET(view));
  g_signal_connect(G_OBJECT(window), "delete-event",
                   G_CALLBACK(on_delete_event), event_channel);

  g_object_unref(plugin);
}
