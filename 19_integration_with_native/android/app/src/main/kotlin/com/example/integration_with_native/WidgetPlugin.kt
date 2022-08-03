package com.example.integration_with_native
import io.flutter.plugin.common.PluginRegistry.Registrar

object WidgetPlugin {
    fun registerWith(registrar: Registrar) {
        registrar
                .platformViewRegistry()
                .registerViewFactory(
                        "INEGRATION_ANDROID", NativeViewFactory(registrar.messenger()))
    }
}