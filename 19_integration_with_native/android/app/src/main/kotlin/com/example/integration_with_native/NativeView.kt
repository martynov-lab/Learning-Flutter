package com.example.integration_with_native

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

// class NativeView internal constructor(
//     context: Context?,
//     messenger: BinaryMessenger?,
//     id: Int
// ) :
//     PlatformView, MethodCallHandler {
//     private val androidViewId = "INEGRATION_ANDROID"
//     private val methodChannelId = "CALL_METHOD"
//     private val intentMessageId = "CALL"
//     private val textView: TextView
//     private val methodChannel: MethodChannel

//    //  @get:Override
//    //  val view: View
//    //      get() = textView

//    // @Override
//     override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
//         when (methodCall.method) {
//             intentMessageId -> setText(methodCall, result)
//             else -> result.notImplemented()
//         }
//     }

//     private fun setText(methodCall: MethodCall, result: Result) {
//         val text = methodCall.arguments as String
//         textView.setText(text)
//         result.success(null)
//     }

//     //@Override
//     override fun dispose() {

//     }

//     init {
//         textView = TextView(context)
//         methodChannel = MethodChannel(messenger?, methodChannelId)
//         methodChannel.setMethodCallHandler(this)
//     }
// }




class FirstWidget internal constructor(context: Context, id: Int, messenger: BinaryMessenger) : PlatformView, MethodCallHandler {
	private val androidViewId = "INEGRATION_ANDROID"
	private val methodChannelId = "CALL_METHOD"
	private val intentMessageId = "CALL"
	 private val view: View
    private val methodChannel: MethodChannel

    override fun getView(): View {
        return textView
    }

    init {
        textView = TextView(context)
        methodChannel = MethodChannel(messenger, methodChannelId)
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
				intentMessageId -> ping(methodCall, result)
            else -> result.notImplemented()
        }
    }

    private fun ping(methodCall: MethodCall, result: Result) {
        textView.setText(text)
        result.success(null)
    }

    override fun dispose() {
    }
}
