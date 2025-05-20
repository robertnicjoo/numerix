#ifndef FLUTTER_PLUGIN_NUMERIX_PLUGIN_H_
#define FLUTTER_PLUGIN_NUMERIX_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace numerix {

class NumerixPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  NumerixPlugin();

  virtual ~NumerixPlugin();

  // Disallow copy and assign.
  NumerixPlugin(const NumerixPlugin&) = delete;
  NumerixPlugin& operator=(const NumerixPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace numerix

#endif  // FLUTTER_PLUGIN_NUMERIX_PLUGIN_H_
