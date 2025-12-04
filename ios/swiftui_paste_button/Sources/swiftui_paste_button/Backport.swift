import SwiftUI

public struct Backport<Content> {
  public let content: Content
  
  public init(_ content: Content) {
    self.content = content
  }
}

public extension Backport where Content: View {
  @ViewBuilder func labelStyle(_ style: BackportLabelStyle = BackportLabelStyle.automatic) -> some View {
    if #available(iOS 14, *) {
      content.labelStyle(style.toLabel)
    } else {
      content
    }
  }
  
  @ViewBuilder func buttonBorderShape(
    _ shape: BackportButtonBorderShape = .automatic
  ) -> some View {
    if #available(iOS 15, *) {
      content.buttonBorderShape(shape.toShape)
    } else {
      content
    }
  }
}

public extension View {
  var backport: Backport<Self> { Backport(self) }
}

public enum BackportLabelStyle: Equatable, Sendable {
  case automatic
  case titleOnly
  case iconOnly
  case titleAndIcon
}

@available(iOS 14, *)
public extension BackportLabelStyle {
  var toLabel: LabelStyle {
    switch self {
    case .automatic:
      return .automatic
    case .iconOnly:
      return .iconOnly
    case .titleAndIcon:
      if #available(iOS 14.5, *) {
        return .titleAndIcon
      } else {
        return .automatic
      }
    case .titleOnly:
      return .titleOnly
    }
  }
}

public enum BackportButtonBorderShape: Equatable, Sendable {
  case automatic
  case capsule
  case roundedRectangle
  case roundedRectangleRadius(_ radius: CGFloat)
  case circle
}


@available(iOS 15, *)
public extension BackportButtonBorderShape {
  var toShape: ButtonBorderShape {
    switch self {
    case .automatic:
      return .automatic
    case .capsule:
      return .capsule
    case .circle:
      if #available(iOS 17, *) {
        return .circle
      } else {
        return .automatic
      }
    case .roundedRectangle:
      return .roundedRectangle
    case .roundedRectangleRadius(radius: let radius):
      return .roundedRectangle(radius: radius)
    }
  }
}
