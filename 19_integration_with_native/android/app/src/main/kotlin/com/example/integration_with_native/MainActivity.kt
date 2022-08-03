package com.example.integration_with_native

// import android.content.*
// import io.flutter.embedding.android.FlutterActivity
// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugin.common.MethodChannel
// import androidx.annotation.NonNull
// import android.content.Intent
// import android.content.IntentFilter
// import dev.flutter.example.NativeViewFactory

// class MainActivity : FlutterActivity() {
//    private val androidViewId = "INEGRATION_ANDROID"
   // private val methodChannelId = "CALL_METHOD"
   // private val intentMessageId = "CALL"
	//private lateinit var channel: MethodChannel


  // @Override
   // override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
   //    super.configureFlutterEngine(flutterEngine)
	// 	flutterEngine
	// 	.platformViewsController
	// 	.registry
	// 	.registerViewFactory(androidViewId, NativeViewFactory(flutterEngine.dartExecutor.binaryMessenger))


//      channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelId)
//
//            channel.setMethodCallHandler { call, result ->
//               if (call.method == intentMessageId) {
//                  val argument = call.arguments() as Map<String, String>?
//                   val text = argument?.get("text")
//                  result.success("$text")
//
//
//        				// textView.setText(text);
//        				// result.success(null);
//               } else {
//                  result.notImplemented()
//               }
//            }
//    }
// }

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    WidgetPlugin.registerWith(this.registrarFor("com.example.flutter_platformview_example.WidgetPlugin"))
  }
}