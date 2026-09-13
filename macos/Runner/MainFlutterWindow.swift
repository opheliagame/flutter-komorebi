import Cocoa
import FlutterMacOS
import NaturalLanguage

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    let embeddingChannel = FlutterMethodChannel(
      name: "semantic_embedding",
      binaryMessenger: flutterViewController.engine.binaryMessenger
    )
    embeddingChannel.setMethodCallHandler { call, result in
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

      result(Self.sentenceEmbedding(for: text))
    }

    super.awakeFromNib()
  }

  private static func sentenceEmbedding(for text: String) -> Any {
    guard #available(macOS 11.0, *) else {
      return FlutterError(
        code: "EMBEDDING_UNAVAILABLE",
        message: "On-device sentence embeddings require macOS 11 or newer.",
        details: nil
      )
    }

    // Always use a single fixed language embedding model (English) so that every
    // call returns vectors of the same dimension. Using per-text language detection
    // previously caused index-time and query-time embeddings to come from different
    // NLEmbedding models with different dimensions (e.g. 512 vs 640), which made the
    // Qdrant vector store reject queries with "dimension mismatch" errors.
    guard let vector = NLEmbedding.sentenceEmbedding(for: .english)?.vector(for: text) else {
      return FlutterError(
        code: "EMBEDDING_UNAVAILABLE",
        message: "No on-device sentence embedding is available for this language.",
        details: NLLanguage.english.rawValue
      )
    }
    return vector
  }
}
