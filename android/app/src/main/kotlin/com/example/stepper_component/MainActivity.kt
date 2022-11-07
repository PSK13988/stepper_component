package com.example.stepper_component

import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    private val CHANNEL = "stepper_component/getCampaignMethodChannel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getCampaignData") {
                val data = getCampaignData()
                result.success(data)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getCampaignData(): String {
        return  """
        {
            "campaign_data": [
                {
                    "title": "Select campaign settings",
                    "message": "For each ad campaign that you create For each ad campaign that you create, For each ad campaign that you create For each ad campaign that you create For each ad campaign that you create For each ad campaign that you create.",
                    "is_next": true,
                    "is_done": false,
                    "is_completed": false
                },
                {
                    "title": "Create an ad group",
                    "message": "For create an ad group that you create For each ad campaign that you create, For create an ad group that you create For each ad campaign that you create For create an ad group that you create For each ad campaign that you create.",
                    "is_next": true,
                    "is_done": false,
                    "is_completed": false
                },
                {
                    "title": "Create an ad",
                    "message": "Try out different ad text to see what brings in the most customers, For create an ad group that you create For each ad campaign that you create, For create an ad group that you create For each ad campaign that you create For create an ad group that you create For each ad campaign that you create.",
                    "is_next": true,
                    "is_done": true,
                    "is_completed": false
                }
            ]
        }
        """.trimIndent();
    }
}
