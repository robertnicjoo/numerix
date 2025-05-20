#include "include/numerix/numerix_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "numerix_plugin.h"

void NumerixPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  numerix::NumerixPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
