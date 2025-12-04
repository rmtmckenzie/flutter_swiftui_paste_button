import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:swiftui_paste_button/paste_controller.dart';
import 'package:swiftui_paste_button/pigeon/pigeon.g.dart';



class SwiftUIPasteButton extends StatefulWidget {
  const SwiftUIPasteButton({super.key, this.params, required this.onPaste});

  final PasteButtonParams? params;
  final PasteCallback onPaste;

  @override
  State<SwiftUIPasteButton> createState() => _SwiftUIPasteButtonState();
}

class _SwiftUIPasteButtonState extends State<SwiftUIPasteButton> {

  int? platformId;

  @override
  void dispose() {
    if (platformId != null) {
      PasteController.removeCallback(platformId!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String viewType = 'com.github.rmtmckenzie/flutter-swiftui-paste-button/paste-button';

    final size = MediaQuery.sizeOf(context);

    // this prevents a crash if a size constraint not given
    return LayoutBuilder(builder: (context, constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: constraints.hasInfiniteWidth ? size.width: constraints.maxWidth,
          maxHeight: constraints.hasInfiniteHeight ? size.height: constraints.maxHeight,
          minWidth: 0,
          minHeight: 0,
        ),
        child: UiKitView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: widget.params?.encode(),
          creationParamsCodec: MessageFlutterApi.pigeonChannelCodec,
          onPlatformViewCreated: (id) {
            // if not mounted, it has already returned so let's ignore
            if (context.mounted) {
              platformId = id;
              PasteController.registerCallback(id, widget.onPaste);
            }
          },
        ),
      );
    });


  }
}
