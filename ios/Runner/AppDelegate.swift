import UIKit
import Flutter

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

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
