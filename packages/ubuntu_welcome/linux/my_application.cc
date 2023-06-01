#include "my_application.h"

#include <flutter_linux/flutter_linux.h>
#include <handy.h>

#include "flutter/generated_plugin_registrant.h"

struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

static void my_application_get_workarea(GtkWindow* window,
                                        GdkRectangle* workarea) {
  GdkWindow* gdk_window = gtk_widget_get_window(GTK_WIDGET(window));
  GdkDisplay* gdk_display = gdk_window_get_display(gdk_window);
  GdkMonitor* monitor =
      gdk_display_get_monitor_at_window(gdk_display, gdk_window);
  gdk_monitor_get_workarea(monitor, workarea);

  // gdk_monitor_get_workarea() is not reliable early on startup. compare the
  // reported workarea to the full geometry and subtract some margins if the
  // system is not reporting the correct workarea with the dock and the top bar
  // excluded.
  GdkRectangle geometry;
  gdk_monitor_get_geometry(monitor, &geometry);
  if (workarea->width == geometry.width &&
      workarea->height == geometry.height) {
    // by default, the dock is ~90px wide and the top bar is ~30px high.
    workarea->width -= 100;
    workarea->height -= 40;
  }
}

static gboolean my_application_fit_to_workarea(GtkWindow* window) {
  gint window_width = 0;
  gint window_height = 0;
  gtk_window_get_default_size(window, &window_width, &window_height);

  GdkRectangle workarea;
  my_application_get_workarea(window, &workarea);

  gboolean fits_workarea =
      window_width <= workarea.width && window_height <= workarea.height;
  if (!fits_workarea) {
    gtk_window_fullscreen(window);
  }
  return fits_workarea;
}

// Implements GApplication::activate.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);

#ifdef NDEBUG
  // Activate an existing app instance if already running but only in
  // production/release mode. Allow multiple instances in debug mode for
  // easier debugging and testing.
  GList* windows = gtk_application_get_windows(GTK_APPLICATION(application));
  if (windows) {
    gtk_window_present(GTK_WINDOW(windows->data));
    return;
  }
#endif

  GtkWindow* window = GTK_WINDOW(hdy_application_window_new());
  gtk_window_set_application(window, GTK_APPLICATION(application));
  gtk_window_set_type_hint(window, GDK_WINDOW_TYPE_HINT_DIALOG);  // no min/max
  gtk_window_set_default_size(window, 960, 680);
  gtk_widget_realize(GTK_WIDGET(window));

  if (my_application_fit_to_workarea(window)) {
#ifdef NDEBUG
    // The window has a fixed size in production/release mode, but resizing
    // the window is allowed in debug mode for testing purposes, or if it
    // doesn't fit the available workarea.
    gtk_window_set_resizable(window, FALSE);
#endif
  }
  gtk_widget_show(GTK_WIDGET(window));

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(
      project, self->dart_entrypoint_arguments);

  FlView* view = fl_view_new(project);
  gtk_widget_show(GTK_WIDGET(view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));

  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

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
