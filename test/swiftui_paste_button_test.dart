// import 'package:flutter_test/flutter_test.dart';
// import 'package:swiftui_paste_button/swiftui_paste_button.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockSwiftuiPasteButtonPlatform
//     with MockPlatformInterfaceMixin
//     implements SwiftUIPasteButtonPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final SwiftUIPasteButtonPlatform initialPlatform = SwiftUIPasteButtonPlatform.instance;
//
//   test('$MethodChannelSwiftUIPasteButton is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelSwiftUIPasteButton>());
//   });
//
//   test('getPlatformVersion', () async {
//     SwiftUIPasteButton swiftuiPasteButtonPlugin = SwiftUIPasteButton();
//     MockSwiftuiPasteButtonPlatform fakePlatform = MockSwiftuiPasteButtonPlatform();
//     SwiftUIPasteButtonPlatform.instance = fakePlatform;
//
//     expect(await swiftuiPasteButtonPlugin.getPlatformVersion(), '42');
//   });
// }
