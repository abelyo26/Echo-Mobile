import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _error;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCurrentUser() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // This would typically call a service
      final userService = UserService();
      _currentUser = await userService.getCurrentUser();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateUser(User updatedUser) {
    _currentUser = updatedUser;
    notifyListeners();
    // Here you would typically call a service to update on server
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
