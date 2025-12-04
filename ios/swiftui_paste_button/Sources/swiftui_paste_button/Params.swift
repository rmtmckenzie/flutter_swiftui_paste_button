import SwiftUI

extension PasteColor {
  var toSwift: Color {
    Color(red: r, green: g, blue: b, opacity: a)
  }
}

extension PasteLabelStyle {
  var toSwift: BackportLabelStyle {
    switch(self) {
    case .automatic:
      return .automatic
    case .titleOnly:
      return .titleOnly
    case .iconOnly:
      return .iconOnly
    case .titleAndIcon:
      return .titleAndIcon
    }
  }
}

extension PasteButtonBorderShape {
  func toSwift(withRadius radius: Double?) -> BackportButtonBorderShape {
    switch(self) {
    case .automatic:
      return .automatic
    case .circle:
      return .circle
    case .capsule:
      return .capsule
    case .roundedRectangle:
      if let radius {
        return .roundedRectangleRadius(CGFloat(radius))
      } else {
        return .roundedRectangle
      }
    }
  }
}

extension PasteAlignment {
  var toSwift: Alignment {
    switch(self) {
    case .bottom:
      return .bottom
    case .bottomLeading:
      return .bottomLeading
    case .bottomTrailing:
      return .bottomTrailing
    case .center:
      return .center
    case .centerFirstTextBaseline:
      return .centerFirstTextBaseline
    case .centerLastTextBaseline:
      return .centerLastTextBaseline
    case .leading:
      return .leading;
    case .leadingFirstTextBaseline:
      return .leadingFirstTextBaseline
    case .leadingLastTextBaseline:
      return .leadingLastTextBaseline
    case .top:
      return .top
    case .topLeading:
      return .topLeading
    case .topTrailing:
      return .topTrailing
    case .trailing:
      return .trailing
    case .trailingFirstTextBaseline:
      return .trailingFirstTextBaseline
    case .trailingLastTextBaseline:
      return .trailingLastTextBaseline
    }
  }
}

extension [Any?] {
  var toPasteButtonParams: PasteButtonParams? {
    PasteButtonParams.fromList(self)
  }
}

extension Double {
  var toSwift: CGFloat {
    CGFloat(self)
  }
}
