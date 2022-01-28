import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: _Keys.sessionId);

  Future<void> setSessionId(String? sessionId) async{
    if (sessionId == null) {
     await  _secureStorage.delete(key: _Keys.sessionId);
    } else {
      await _secureStorage.write(key: _Keys.sessionId, value: sessionId);
    }
  }
}

abstract class _Keys {
  static const sessionId = 'session_id';
}
