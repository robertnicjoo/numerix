//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <numerix/numerix_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) numerix_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NumerixPlugin");
  numerix_plugin_register_with_registrar(numerix_registrar);
}
