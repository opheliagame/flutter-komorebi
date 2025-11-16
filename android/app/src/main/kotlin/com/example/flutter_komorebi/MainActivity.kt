package com.example.flutter_komorebi

import android.content.ClipData
import android.content.ClipboardManager
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream

class MainActivity : FlutterActivity() {

    private val CHANNEL = "image_clipboard"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->

            when (call.method) {

                "copyImage" -> {
                    val bytes = call.argument<ByteArray>("bytes")!!
                    val file = File(cacheDir, "clipboard_image.png")
                    FileOutputStream(file).use { it.write(bytes) }

                    val uri = FileProvider.getUriForFile(
                        this,
                        "$packageName.fileprovider",
                        file
                    )

                    val clip = ClipData.newUri(contentResolver, "image", uri)
                    val clipboard = getSystemService(CLIPBOARD_SERVICE) as ClipboardManager
                    clipboard.setPrimaryClip(clip)

                    result.success(null)
                }

                "pasteImage" -> {
                    val clipboard = getSystemService(CLIPBOARD_SERVICE) as ClipboardManager

                    if (!clipboard.hasPrimaryClip()) {
                        result.success(null)
                        return@setMethodCallHandler
                    }

                    val clip = clipboard.primaryClip
                    val item = clip?.getItemAt(0)

                    val uri: Uri? = item?.uri
                    if (uri == null) {
                        result.success(null)
                        return@setMethodCallHandler
                    }

                    val input = contentResolver.openInputStream(uri)
                    val bytes = input?.readBytes()

                    result.success(bytes)
                }

                else -> result.notImplemented()
            }
        }
    }
}
