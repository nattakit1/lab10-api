import 'package:flutter/material.dart';
import '../services/auth_api_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApiService _apiService = AuthApiService();
  bool _isAuthenticated = false;
  bool _isAdmin = false;
  String _username = '';
  String _token = '';

  bool get isAuthenticated => _isAuthenticated;
  bool get isAdmin => _isAdmin;
  String get username => _username;
  String get token => _token;

  Future<void> login(String username, String password) async {
    try {
      final token = await _apiService.login(username, password);
      _token = token;
      _isAuthenticated = true;
      _username = username;

      // Determine if the user is an admin
      // In Fake Store API, 'johnd' is user id=1. We treat id=1 as admin.
      _isAdmin = (username == 'johnd');

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void logout() {
    _isAuthenticated = false;
    _isAdmin = false;
    _username = '';
    _token = '';
    notifyListeners();
  }
}
