package dev.flutter.example

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView
import android.widget.TextView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import static io.flutter.plugin.common.MethodChannel.MethodCallHandler
import static io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

class NativeView internal constructor(private val context: Context, id: Int, args: Any?,  messenger: BinaryMessenger?) :
        PlatformView, MethodCallHandler {
    private val textView: TextView
    private val methodChannel: MethodChannel
    private val androidViewId = "INEGRATION_ANDROID"
    private val methodChannelId = "CALL_METHOD"
    private val intentMessageId = "CALL"
    methodChannel = MethodChannel(messenger, methodChannelId) //ваш метод
    methodChannel.setMethodCallHandler(this)


    val text = creationParams!!.get("text")

    override fun getView(): View {
        return textView
    }

   MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelId)setMethodCallHandler { 
    call, result ->
        if (call.method == intentMessageId) {
            val argument = call.arguments() as Map<String, String>?
            val text = argument?.get("text")
            textView.setText(text);
//            result.success(null);
            result.success("$text")


            // textView.setText(text);
            // result.success(null);
        } else {
            result.notImplemented()
        }
    }

    override fun dispose() {}

    init {
        textView = TextView(context)
        textView.textSize = 22f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.text = "text: $creationParams"
    }
}
