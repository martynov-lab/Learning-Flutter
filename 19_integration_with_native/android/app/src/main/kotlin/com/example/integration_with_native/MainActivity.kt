package com.example.integration_with_native

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random

class MainActivity: FlutterActivity() {
	prinvate val androidViewId = "INEGRATION_ANDROID"
  private val methodChannelId = "CALL_METHOD"
  private val intentName = "EVENTS"
  private val intentMessageId = "CALL"

   private var receiver: BroadcastReceiver? = null

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
   super.configureFlutterEngine(flutterEngine)
	flutterEngine
		.platformViewController
		.registery
		.registerViewFactory(androidViewId, NativeViewFactory(flutterEngine.dartExecutor.binaryMessenger))
		

   MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelId).setMethodCallHandler {
      call, result ->
		if (call.method == intentMessageId) {
			
         String text = RandomFunction(call.argument("text"));

         if (text != null) {
            result.success(intent.getIntExtra(intentMessageId));
         } else {
            result.error("UNAVAILABLE", "Text is null", null);
         }
		} else {
			result.notImplemented()
		}
   }

  }

}
