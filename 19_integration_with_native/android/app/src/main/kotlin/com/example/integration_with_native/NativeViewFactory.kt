package dev.flutter.example

import android.content.Context
import android.view.View
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class NativeViewFactory(messenger: BinaryMessenger) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    private val binaryMessenger: BinaryMessenger = messenger

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return NativeView(context!!, viewId, creationParams, binaryMessenger)
    }
}
