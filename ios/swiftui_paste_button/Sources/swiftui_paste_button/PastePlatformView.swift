import Flutter
import UIKit
import SwiftUI

class PastePlatformView: NSObject, FlutterPlatformView {
  private var _view: UIView
  
  init(
    frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: PasteButtonParams?,
    binaryMessenger messenger: FlutterBinaryMessenger,
    api: PigeonFlutterApi,
  ) {
    _view = UIHostingController(rootView: PasteButtonView(params: args) { data in
      DispatchQueue.main.async {
        api.sendMessage(id: viewId, data: data)
      }
    }).view
    _view.backgroundColor = UIColor.clear
    super.init()
  }
  
  func view() -> UIView {
    return _view
  }
}
