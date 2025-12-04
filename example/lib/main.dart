import 'package:flutter/material.dart';
import 'package:swiftui_paste_button/pigeon/pigeon.g.dart';
import 'package:swiftui_paste_button/swiftui_paste_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> pastes1 = [];
  List<String> pastes2 = [];
  List<String> pastes3 = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Paste Button"),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 50),
              child: SizedBox(
                width: 90,
                child: SwiftUIPasteButton(
                  onPaste: (data) {
                    setState(() {
                      pastes1 = data;
                    });
                  },
                  params: PasteButtonParams(
                    color: PasteColor(r: 0, g: 0, b: 0.3, a: 255),
                    labelStyle: PasteLabelStyle.titleAndIcon,
                    buttonBorderShape: PasteButtonBorderShape.automatic,
                    // buttonBorderShapeRadius: 5,
                    width: 140,
                    height: 30,
                    alignment: PasteAlignment.center,
                  ),
                ),
              ),
            ),
            ...pastes1.map((str) => Text(str)),
            SizedBox(height: 20),
            Text("iOS 14+ (uses label)"),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 50),
              child: SwiftUIPasteButton(
                onPaste: (data) {
                  setState(() {
                    pastes2 = data;
                  });
                },
                params: PasteButtonParams(
                  color: PasteColor(r: 0, g: 0, b: 0.3, a: 255),
                  labelStyle: PasteLabelStyle.titleAndIcon,
                  buttonBorderShape: PasteButtonBorderShape.automatic,
                  // buttonBorderShapeRadius: 5,
                  width: 120,
                  height: 50,
                  alignment: PasteAlignment.center,
                  versionOverride: VersionOverride.iOS14,
                ),
              ),
            ),
            ...pastes2.map((str) => Text(str)),
            SizedBox(height: 20),
            Text("Other iOS"),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 50),
              child: SwiftUIPasteButton(
                onPaste: (data) {
                  setState(() {
                    pastes3 = data;
                  });
                },
                params: PasteButtonParams(
                  color: PasteColor(r: 0, g: 0, b: 0.3, a: 255),
                  labelStyle: PasteLabelStyle.titleAndIcon,
                  buttonBorderShape: PasteButtonBorderShape.automatic,
                  // buttonBorderShapeRadius: 5,
                  width: 120,
                  height: 50,
                  alignment: PasteAlignment.center,
                  versionOverride: VersionOverride.iOS13,
                ),
              ),
            ),
            ...pastes3.map((str) => Text(str)),
          ],
        ),
      ),
    );
  }
}
