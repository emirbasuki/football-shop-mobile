import 'package:flutter/material.dart';

/// Provider untuk menyimpan informasi user yang sedang login
class UserProvider extends ChangeNotifier {
  int? _userId;
  String? _username;

  int? get userId => _userId;
  String? get username => _username;

  bool get isLoggedIn => _userId != null;

  /// Set user info setelah login berhasil
  void setUser(int userId, String username) {
    _userId = userId;
    _username = username;
    notifyListeners();
  }

  /// Clear user info saat logout
  void logout() {
    _userId = null;
    _username = null;
    notifyListeners();
  }
}
