package com.example.lesson19_01

import android.annotation.SuppressLint
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.view.View
import android.widget.EditText
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val androidView = "INTEGRATION_ANDROID"
    private val eventsChannel = "CALL_EVENTS"
    private val methodChannel = "CALL_METHOD"
    private val intentName = "EVENTS"
    private val intentMessage = "CALL"

    private var receiver: BroadcastReceiver? = null

    @SuppressLint("ResourceType")
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterEngine.platformViewsController.registry.registerViewFactory(
            androidView,
            AndroidNativeFactory(flutterEngine.dartExecutor.binaryMessenger)
        )

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            methodChannel
        ).setMethodCallHandler { call, result ->
            if (call.method == intentMessage) {
                result.success(findViewById<EditText?>(11).text.toString())
            } else {
                result.notImplemented()
            }
        }

        EventChannel(flutterEngine.dartExecutor, eventsChannel).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(args: Any?, events: EventChannel.EventSink) {
                    receiver = createReceiver(events)
                    applicationContext?.registerReceiver(receiver, IntentFilter(intentName))
                }

                override fun onCancel(args: Any?) {
                    //job.cancel()
                    receiver = null
                }
            }
        )
    }

    fun createReceiver(events: EventChannel.EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                events.success(intent.getStringExtra(intentMessage))
            }
        }
    }
}
