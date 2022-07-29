import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
   private val androidViewId = "INEGRATION_ANDROID"
   private val methodChannelId = "CALL_METHOD"
   private val intentMessageId = "CALL"

   override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
      super.configureFlutterEngine(flutterEngine)
      // flutterEngine.platformViewsController.registry.registerViewFactory(
      //       androidViewId,
      //       NativeViewFactory()
      // )

      MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelId)
            .setMethodCallHandler { call, result ->
               if (call.method == intentMessageId) {
                  // String text = call.argument("text");
                  // String batteryLevel = RandomFunction(text);

                  // if (batteryLevel != null) {
                  //     result.success(batteryLevel);
                  // } else {
                  //     result.error("UNAVAILABLE", "Battery level not available.", null);
                  // }
                  result.success("Привет")
               } else {
                  result.notImplemented()
               }
            }
   }
}
