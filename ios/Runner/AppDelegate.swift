import UIKit
import Flutter
import NaturalLanguage

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {

  func copyImageToClipboard(bytes: Data) {
    if let image = UIImage(data: bytes) {
        UIPasteboard.general.image = image
    }
  }

  func pasteImageFromClipboard() -> Data? {
    if let image = UIPasteboard.general.image {
        return image.pngData() // Flutter-friendly
    }
    return nil
  }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "image_clipboard",
                                       binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call, result) in
      switch call.method {

      case "copyImage":
        guard let args = call.arguments as? [String: Any],
              let bytes = args["bytes"] as? FlutterStandardTypedData else {
          result(FlutterError(code: "BAD_ARGS", message: nil, details: nil))
          return
        }
        self.copyImageToClipboard(bytes: bytes.data)
        result(nil)

      case "pasteImage":
        if let data = self.pasteImageFromClipboard() {
          result(FlutterStandardTypedData(bytes: data))
        } else {
          result(nil)
        }

      default:
        result(FlutterMethodNotImplemented)
      }
    }

    let embeddingChannel = FlutterMethodChannel(
      name: "semantic_embedding",
      binaryMessenger: controller.binaryMessenger
    )
    embeddingChannel.setMethodCallHandler { (call, result) in
      guard call.method == "embed" else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard
        let arguments = call.arguments as? [String: Any],
        let text = arguments["text"] as? String,
        !text.isEmpty
      else {
        result(FlutterError(code: "BAD_ARGS", message: "A non-empty text value is required.", details: nil))
        return
      }

      guard #available(iOS 14.0, *) else {
        result(
          FlutterError(
            code: "EMBEDDING_UNAVAILABLE",
            message: "On-device sentence embeddings require iOS 14 or newer.",
            details: nil
          )
        )
        return
      }

      // Always use a single fixed language embedding model (English) so that every
      // call returns vectors of the same dimension. Per-text language detection
      // previously caused index-time and query-time embeddings to come from different
      // NLEmbedding models with different dimensions (e.g. 512 vs 640), which made the
      // Qdrant vector store reject queries with "dimension mismatch" errors.
      guard let vector = NLEmbedding.sentenceEmbedding(for: .english)?.vector(for: text) else {
        result(
          FlutterError(
            code: "EMBEDDING_UNAVAILABLE",
            message: "No on-device sentence embedding is available for this language.",
            details: NLLanguage.english.rawValue
          )
        )
        return
      }
      result(vector)
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
