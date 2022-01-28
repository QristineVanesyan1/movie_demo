import 'package:move_demo/widgets/auth/session_provider.dart';

class MyAppModel {
  final _sessionDataProvider = SessionDataProvider();
  bool _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    _isAuth = (sessionId != null);
  }
}
