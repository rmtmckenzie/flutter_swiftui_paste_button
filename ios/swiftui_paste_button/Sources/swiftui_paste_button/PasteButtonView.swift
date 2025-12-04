import SwiftUI
import UIKit

struct PasteButtonView: View {
  let params: PasteButtonParams?
  let callback: ([String]) -> Void
  let uikitBundle: Bundle
  
  init(params: PasteButtonParams?, callback: @escaping ([String]) -> Void) {
    self.params = params
    self.callback = callback
    self.uikitBundle = Bundle.init(for: UIButton.self)
  }
  
  var _foregroundColor: Color {
    let color: Color
    if let pColor = params?.color {
      if (pColor.isLight()) {
        color = .black
      } else {
        color = .white
      }
    } else {
      color = .secondary
    }
    
    return color
  }
  
  @available(iOS 16, *)
  var _pasteButton: some View {
    PasteButton(payloadType: String.self) { strings in
      self.callback(strings)
    }
    .tint(params?.color?.toSwift ?? .primary)
    .frame(width: params?.width?.toSwift, height: params?.height?.toSwift, alignment: params?.alignment?.toSwift ?? .center)
    .ignoresSafeArea(.all)
    .backport.buttonBorderShape(params?.buttonBorderShape?.toSwift(withRadius: params?.buttonBorderShapeRadius) ?? .automatic)
    .backport.labelStyle(params?.labelStyle?.toSwift ?? .automatic)
  }
  
  var _cornerRadius: Double {
    switch(params?.buttonBorderShape) {
    case .capsule: return .infinity
    case .circle: return .infinity
    case .roundedRectangle:
      if let br =  params?.buttonBorderShapeRadius {
        return br
      }
      fallthrough
    case .automatic: fallthrough
    case nil: return 5
    }
  }
  
  @available(iOS 14, *)
  var _button14: some View {
    Button {
      if let clipboardStrings = UIPasteboard.general.strings {
        self.callback(clipboardStrings)
      }
    } label: {
      Label {
        Text(uikitBundle.localizedString(forKey: "Paste", value: "Paste", table: nil))
      } icon: {
        Image(systemName: "doc.on.clipboard").font(Font.system(size: 12.8))
      }
      .labelStyle(CustomLabelSpacing(spacing: 4.5))
    }
    .foregroundColor(_foregroundColor)
    .padding(.horizontal, 12)
    .padding(.vertical, 7)
    .background(params?.color?.toSwift ?? .primary)
    .cornerRadius(_cornerRadius)
    .frame(width: params?.width?.toSwift, height: params?.height?.toSwift, alignment: params?.alignment?.toSwift ?? .center)
  }
  
  var _button13: some View {
    Button(action: {
      if let clipboardStrings = UIPasteboard.general.strings {
        self.callback(clipboardStrings)
      }
    }) {
      HStack(spacing: 4.5) {
        Image(systemName: "doc.on.clipboard").font(Font.system(size: 12.8))
        Text(uikitBundle.localizedString(forKey: "Paste", value: "Paste", table: nil))
      }
    }
    .foregroundColor(_foregroundColor)
    .padding(.horizontal, 12)
    .padding(.vertical, 7)
    .background(params?.color?.toSwift ?? .primary)
    .cornerRadius(_cornerRadius)
    .frame(width: params?.width?.toSwift, height: params?.height?.toSwift, alignment: params?.alignment?.toSwift ?? .center)
  }
  //
  @ViewBuilder
  var body: some View {
    if #available(iOS 16, *), params?.versionOverride != .iOS14, params?.versionOverride != .iOS13 {
      _pasteButton
    } else if #available(iOS 14, *), params?.versionOverride != .iOS13 {
      _button14
    } else {
      _button13
    }
  }
}

struct CustomLabelSpacing: LabelStyle {
  var spacing: Double = 0.0
  
  func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: spacing) {
      configuration.icon
      configuration.title
    }
  }
}
