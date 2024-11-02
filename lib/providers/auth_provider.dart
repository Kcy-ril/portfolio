import 'package:flutter/material.dart';

class myAuthProvider with ChangeNotifier {
  String? _registeredName;
  String? _registeredPassword;
  String? _currentUser;

  String? get currentUser => _currentUser;

  Future<bool> register(String name, String password) async {
    if (_registeredName != null && _registeredName == name) return false; // Username already exists
    _registeredName = name;
    _registeredPassword = password;
    return true;
  }

  Future<bool> login(String name, String password) async {
    if (_registeredName == name && _registeredPassword == password) {
      _currentUser = name;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();


  }
}
