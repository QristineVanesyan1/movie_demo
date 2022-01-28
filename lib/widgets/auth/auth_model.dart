import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:move_demo/domain/api_client/api_client.dart';
import 'package:move_demo/navigation/main_navigation.dart';
import 'package:move_demo/widgets/auth/session_provider.dart';

class AuthModel extends ChangeNotifier {
  final _sessionDataProvider = SessionDataProvider();
  final ApiClient _apiClient = ApiClient();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginController.text;
    final password = passwordController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionID;
    try {
      sessionID = await _apiClient.auth(login, password);
      _isAuthProgress = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      switch (e.exceptionType) {
        case ApiClientExceptionType.auth:
          _errorMessage = 'Connection error,check connection';
          return;

        case ApiClientExceptionType.network:
          _errorMessage = 'Neverniy login ili parol';
          return;

        case ApiClientExceptionType.other:
          _errorMessage = 'Something went wrong. Try again!';
          return;
      }
    } catch (_) {
      _errorMessage = 'Something went wrong. Try again!';
      return;
    }
    _isAuthProgress = false;
    if (_errorMessage != null || sessionID == null) {
      notifyListeners();
      return;
    }

    await _sessionDataProvider.setSessionId(sessionID);
    unawaited(Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.mainScreen));
  }
}

enum ApiClientExceptionType { network, auth, other }

class ApiClientException implements Exception {
  const ApiClientException({required this.exceptionType});
  final ApiClientExceptionType exceptionType;
}
