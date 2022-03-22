package com.example.lesson19_01

import android.annotation.SuppressLint
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.text.Editable
import android.util.TypedValue
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import androidx.core.content.ContextCompat.startActivity
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView


@SuppressLint("SetTextI18n", "ResourceType")
class AndroidNativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?, messenger: BinaryMessenger): PlatformView {
    private val editText: EditText = EditText(context)
    private val button: Button = Button(context)
    private var layout = LinearLayout(context)

    private val intentEvent = "EVENTS"
    private val intentCall = "CALL"

    override fun getView(): View {
//        layout.removeAllViews()
//        table.removeAllViews()
//        table.addView(editText)
//        table.addView(button)
//        layout.addView(table)
//        if (editText.parent != null) {
//            (editText.parent as ViewGroup).removeView(editText)
//        }
//
//        if (button.parent != null) {
//            (button.parent as ViewGroup).removeView(button)
//
//        }
//        layout.addView(button)
//        layout.addView(editText)
//        return layout
        return layout
    }

    override fun dispose() {}

    fun testing(): String {
        return editText.text.toString()
    }

    init {
        layout.setOrientation(LinearLayout.VERTICAL)
        editText.textSize = 13f
        editText.setBackgroundColor(Color.rgb(255, 255, 255))
        editText.background = borderDrawable(
            width = 2.dpToPixels(context),
            color = Color.parseColor("#DA1884"),
            bgColor = Color.WHITE
        )

        editText.isSingleLine = true
        editText.setSingleLine()
        editText.height = 150
        editText.id = 11

        layout.addView(editText)

        button.textSize = 13f
        button.text = "Android Native Button"
        button.id = 12

        layout.addView(button)

        button.setOnClickListener {
            val intent = Intent(intentEvent)
            intent.putExtra(intentCall, editText.text.toString())
            context.sendBroadcast(intent)
        }
    }

    fun borderDrawable(
        width: Int = 10,
        color: Int = Color.BLACK,
        bgColor: Int = Color.TRANSPARENT
    ): Drawable {
        return GradientDrawable().apply {
            shape = GradientDrawable.RECTANGLE
            setStroke(width, color)
            setColor(bgColor)
        }
    }

    fun Int.dpToPixels(context: Context):Int = TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_DIP, this.toFloat(), context.resources.displayMetrics
    ).toInt()
}
