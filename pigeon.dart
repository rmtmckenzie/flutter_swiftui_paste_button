import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartPackageName: 'swiftui_paste_button',
    dartOut: 'lib/pigeon/pigeon.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/swiftui_paste_button/Sources/swiftui_paste_button/Pigeon.g.swift',
    swiftOptions: SwiftOptions(),
  ),
)
@FlutterApi()
abstract class MessageFlutterApi {
  void flutterMethod(int id, List<String> data);
}

class PasteColor {
  PasteColor({required this.r, required this.g, required this.b, required this.a});

  final double r;
  final double g;
  final double b;
  final double a;
}

enum PasteLabelStyle { automatic, titleOnly, iconOnly, titleAndIcon }

enum PasteAlignmentDirection { horizontal, vertical }

enum PasteAlignment {
  bottom,
  bottomLeading,
  bottomTrailing,
  center,
  centerFirstTextBaseline,
  centerLastTextBaseline,
  leading,
  leadingFirstTextBaseline,
  leadingLastTextBaseline,
  top,
  topLeading,
  topTrailing,
  trailing,
  trailingFirstTextBaseline,
  trailingLastTextBaseline,
}

enum PasteButtonBorderShape { automatic, roundedRectangle, capsule, circle }

enum VersionOverride { iOS14, iOS13 }

class PasteButtonParams {
  final PasteColor? color;
  final PasteLabelStyle? labelStyle;
  final PasteButtonBorderShape? buttonBorderShape;

  // this is only used if PasteButtonBorderShape == .roundedRectangle
  final double? buttonBorderShapeRadius;
  final double? width;
  final double? height;
  final PasteAlignment? alignment;

  final VersionOverride? versionOverride;

  PasteButtonParams({
    this.color,
    this.labelStyle,
    this.buttonBorderShape,
    this.buttonBorderShapeRadius,
    this.width,
    this.height,
    this.alignment,
    this.versionOverride,
  });
}
