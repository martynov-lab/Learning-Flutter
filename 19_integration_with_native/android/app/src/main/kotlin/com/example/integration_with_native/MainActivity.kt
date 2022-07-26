package com.example.integration_with_native

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random


// import android.content.Context
// import android.content.ContextWrapper
// import android.content.Intent
// import android.content.IntentFilter
// import android.os.BatteryManager
// import android.os.Build.VERSION
// import android.os.Build.VERSION_CODES

class MainActivity: FlutterActivity() {
	prinvate val androidViewId = "INEGRATION_ANDROID"
  private val eventChannel = "CALL_EVENTS"
  private val methodChannelId = "CALL_METHOD"
  private val intentName = "EVENTS"
  private val intentMessageId = "CALL"

//   private var receiver: BroadcastReceiver? = null
//   lateinit var job: Job

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
   super.configureFlutterEngine(flutterEngine)
	flutterEngine
		.platformViewController
		.registery
		.registerViewFactory(androidViewId, AndroidButtonViewFactory(flutterEngine.dartExecutor.binaryMessenger))
		

   MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelId).setMethodCallHandler {
      call, result ->
		if (call.method == intentMessageId) {
			
         String text = RandomFunction(call.argument("text"));

         if (text != null) {
            result.success(text);
         } else {
            result.error("UNAVAILABLE", "Text is null", null);
         }
		} else {
			result.notImplemented()
		}
   }
	// EventChannel(flutterEngine.dartExecutor, eventChannel).setStreamHandler(
	// 	object:EventChannel.StreamHandler {
	//  		qoverride fun onListen(args: Any?, events: EventsCannel.EventSink){
	// 	  val intent = Intent(intentName)
	// 	  receiver = createReceiver(events)
	// 	  applicationContext?.registerReceiver(receiver, IntentFilter(intentName))
	// 	  job = CoroutineScope(Dispatchers.Default).launch {
	// 		  for (i in 1..20){
	// 			  intent.putExtra(intentMessageId, Rendom.nextInt(0,100))
	// 			  applicationContext?.sendBroadcast(intent)
	// 			  delay(1000)
	// 		   }
	// 	   }
	//    }

	//   override fun onCancel(args:Any?){
	// 	  job.cancel()
	// 	  	receiver = null
	//    }
   // }
	// )
  }


  



//   fun createReceiver (events: EventChannel.EventSink): BroadcastReceiver? {
// 	return object : BroadcastReceiver(){
// 		override fun onReceive(context: Context, intent: Intent){
// 			events.success(intent.getIntExtra(intentMessageId,  0))
// 		}
// 	}
//   }

}
