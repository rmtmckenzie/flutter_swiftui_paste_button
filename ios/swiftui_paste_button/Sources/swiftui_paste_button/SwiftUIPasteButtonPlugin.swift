import Flutter
import UIKit

public class SwiftUIPasteButtonPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let api = PigeonFlutterApi(messenger: registrar.messenger())
    let factory = PastePlatformViewFactory(messenger: registrar.messenger(), api: api)
  
    registrar.register(factory, withId: "com.github.rmtmckenzie/flutter-swiftui-paste-button/paste-button")
  }
}


public class PigeonFlutterApi {
  var flutterAPI: MessageFlutterApi
  
  init(messenger: FlutterBinaryMessenger) {
    self.flutterAPI = MessageFlutterApi(binaryMessenger: messenger)
  }
  
  func sendMessage(id: Int64, data: [String]) {
    flutterAPI.flutterMethod(id: id, data: data) { result in
      // nothing for now
    }
  }
}
