package dev.flutter.example

import android.content.Context
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import kotlin.reflect.jvm.internal.impl.load.kotlin.JvmType.Object




//class NativeViewFactory(messenger: BinaryMessenger) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
//
//    private val binaryMessenger: BinaryMessenger = messenger
//
//    @Override
//    fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
//        val creationParams = args as Map<String?, Any?>?
//        return NativeView(context!!, viewId, creationParams, binaryMessenger)
//    }
//}


class NativeViewFactory(messenger: BinaryMessenger) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private val messenger: BinaryMessenger
    @Override
    fun create(context: Context?, id: Int, args: Any?): PlatformView {

        return NativeView(context, messenger, id)
    }

    init {
        this.messenger = messenger
    }
}
