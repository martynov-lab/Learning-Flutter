package com.example.integration_with_native

// import android.content.Context
// import io.flutter.plugin.common.StandardMessageCodec
// import io.flutter.plugin.platform.PlatformView
// import io.flutter.plugin.platform.PlatformViewFactory
// import io.flutter.plugin.common.BinaryMessenger
// import kotlin.reflect.jvm.internal.impl.load.kotlin.JvmType.Object




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


// class NativeViewFactory(messenger: BinaryMessenger) :
//     PlatformViewFactory(StandardMessageCodec.INSTANCE) {
//     private val messenger: BinaryMessenger
//     //@Override
// 	 override fun create(context: Context?, id: Int, args: Any?): PlatformView {

//         return NativeView(context, messenger, id)
//     }

//     init {
//         this.messenger = messenger
//     }
// }

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class NativeViewFactory(private val messenger: BinaryMessenger) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context?, id: Int, o: Any?): PlatformView {
        return NativeView(context = context!!, id = id, messenger = messenger)
    }
}