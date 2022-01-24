cmake_minimum_required(VERSION 3.10)
set(PROJECT_NAME "ubuntu_wizard")
project(${PROJECT_NAME} LANGUAGES CXX)

# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "ubuntu_wizard_plugin")

add_library(${PLUGIN_NAME} SHARED
  "ubuntu_wizard_plugin.cc"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter)
target_link_libraries(${PLUGIN_NAME} PRIVATE PkgConfig::GTK)

if(ENABLE_LIBHANDY)
  pkg_check_modules(LIBHANDY REQUIRED IMPORTED_TARGET libhandy-1)
  add_definitions("-DHAVE_LIBHANDY")
  target_link_libraries(${PLUGIN_NAME} PRIVATE PkgConfig::LIBHANDY)
endif(ENABLE_LIBHANDY)

# List of absolute paths to libraries that should be bundled with the plugin
set(ubuntu_wizard_bundled_libraries
  ""
  PARENT_SCOPE
)
