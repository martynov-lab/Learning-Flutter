package dev.flutter.example

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.platform.PlatformView

class NativeView internal constructor(
    context: Context?,
    messenger: BinaryMessenger?,
    id: Int
) :
    PlatformView, MethodCallHandler {
    private val androidViewId = "INEGRATION_ANDROID"
    private val methodChannelId = "CALL_METHOD"
    private val intentMessageId = "CALL"
    private val textView: TextView
    private val methodChannel: MethodChannel

    @get:Override
    val view: View
        get() = textView

    @Override
    fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            intentMessageId -> setText(methodCall, result)
            else -> result.notImplemented()
        }
    }

    private fun setText(methodCall: MethodCall, result: Result) {
        val text = methodCall.arguments as String
        textView.setText(text)
        result.success(null)
    }

    @Override
    fun dispose() {

    }

    init {
        textView = TextView(context)
        methodChannel = MethodChannel(messenger, methodChannelId)
        methodChannel.setMethodCallHandler(this)
    }
}
