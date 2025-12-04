import Flutter
import UIKit
import SwiftUI

class PastePlatformViewFactory: NSObject, FlutterPlatformViewFactory {
  private var messenger: FlutterBinaryMessenger
  private var api: PigeonFlutterApi
  
  init(messenger: FlutterBinaryMessenger, api: PigeonFlutterApi) {
    self.messenger = messenger
    self.api = api
    super.init()
  }
  
  
  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {
    
    let params = (args as? [Any?])?.toPasteButtonParams
    
    return PastePlatformView(
      frame: frame,
      viewIdentifier: viewId,
      arguments: params,
      binaryMessenger: messenger,
      api: api,
    )
  }
  
  public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    return PigeonPigeonCodec.shared
  }
}



extension PasteColor {
    func isLight(threshold: Float = 0.5) -> Bool {
        let brightness = Float(((r * 299) + (g * 587) + (b * 114)) / 1000)
        return (brightness > threshold)
    }
}
