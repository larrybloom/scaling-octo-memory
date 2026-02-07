// lib/presentation/providers/auth_provider.dart
import 'package:flutter/foundation.dart';
import '../../data/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _currentUser;
  bool _isAuthenticated = false;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement actual API call to your C# backend
      await Future.delayed(const Duration(seconds: 2));

      // Mock response
      _currentUser = UserModel(
        id: '1',
        name: 'John Doe',
        email: email,
        phoneNumber: '+1234567890',
        location: 'Lagos',
        role: UserRole.patient,
        createdAt: DateTime.now(),
      );

      _isAuthenticated = true;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signup({
    required String name,
    required String email,
    required String phoneNumber,
    required String location,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement actual API call to your C# backend
      await Future.delayed(const Duration(seconds: 2));

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
