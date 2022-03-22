package com.example.lesson19_01

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
class AndroidNativeFactory(messenger: BinaryMessenger): PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private val binaryMessenger: BinaryMessenger = messenger

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return AndroidNativeView(context, viewId, creationParams, binaryMessenger)
    }
}