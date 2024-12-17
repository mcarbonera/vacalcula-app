package com.example.vacalcula

import android.media.MediaPlayer
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val CHANNEL = "samples.flutter.dev/playMp3"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      if (call.method == "playMuuOnButtonPress") {
        val playMp3Return = playMuuOnButtonPress()

        if (playMp3Return != -1) {
          result.success(playMp3Return)
        } else {
          result.error("UNAVAILABLE", "Falha ao reproduzir mp3.", null)
        }
      } else {
        result.notImplemented()
      }
    }
  }

  private fun playMuuOnButtonPress(): Int {
    val resID = resources.getIdentifier("vaca_mugindo", "raw", packageName);
    val mediaPlayer = MediaPlayer.create(this,resID);
    mediaPlayer.start();

    return resID;
  }
}
