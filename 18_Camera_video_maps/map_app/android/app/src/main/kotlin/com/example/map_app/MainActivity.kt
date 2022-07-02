package com.example.map_app
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
	 override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    //MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("9d6d3b2c-9912-4368-a954-694b1e33e01c") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}
