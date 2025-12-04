import 'package:swiftui_paste_button/pigeon/pigeon.g.dart';

typedef PasteCallback = void Function(List<String> paste);

class _Receiver implements MessageFlutterApi {
  static const _Receiver instance = _Receiver._();

  const _Receiver._();

  factory _Receiver() => instance;

  @override
  void flutterMethod(int id, List<String> data) {
    return PasteController._receive(id, data);
  }
}

abstract class PasteController {

  static final Map<int, PasteCallback> _callbacks = {};

  static void _receive(int id, List<String> data) {
    final callback = _callbacks[id];
    if (callback != null) {
      callback(data);
    }
  }

  static void registerCallback(int id, Function(List<String> paste) callback) {
    if (_callbacks.isEmpty) {
      MessageFlutterApi.setUp(_Receiver());
    }
    _callbacks[id] = callback;
  }

  static void removeCallback(int id) {
    _callbacks.remove(id);
    if (_callbacks.isEmpty) {
      MessageFlutterApi.setUp(null);
    }
  }


}
