import 'dart:async';

class LockStatusNotifier {
  static final LockStatusNotifier _instance = LockStatusNotifier._internal();
  factory LockStatusNotifier() => _instance;
  LockStatusNotifier._internal();

  final StreamController<String> _controller = StreamController<String>.broadcast();

  Stream<String> get stream => _controller.stream;

  void notifyStatusChanged(String eventType) {
    if (!_controller.isClosed) {
      _controller.add(eventType);
    }
  }

  void dispose() {
    if (!_controller.isClosed) {
      _controller.close();
    }
  }
}