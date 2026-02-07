// lib/core/routes/app_routes.dart
import 'package:flutter/material.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/auth/signup_screen.dart';
import '../../presentation/screens/patient/patient_dashboard_screen.dart';
import '../../presentation/screens/doctor/doctor_dashboard_screen.dart';
import '../../presentation/screens/admin/admin_dashboard_screen.dart';
import '../../data/models/user_model.dart';

class AppRoutes {
  static const String login = '/';
  static const String signup = '/signup';
  static const String patientDashboard = '/patient-dashboard';
  static const String doctorDashboard = '/doctor-dashboard';
  static const String adminDashboard = '/admin-dashboard';
  static const String superAdminDashboard = '/super-admin-dashboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      
      case patientDashboard:
        return MaterialPageRoute(
          builder: (_) => const PatientDashboardScreen(),
        );
      
      case doctorDashboard:
        return MaterialPageRoute(
          builder: (_) => const DoctorDashboardScreen(),
        );
      
      case adminDashboard:
        return MaterialPageRoute(
          builder: (_) => const AdminDashboardScreen(
            userRole: UserRole.admin,
          ),
        );
      
      case superAdminDashboard:
        return MaterialPageRoute(
          builder: (_) => const AdminDashboardScreen(
            userRole: UserRole.superAdmin,
          ),
        );
      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static String getDashboardRoute(UserRole role) {
    switch (role) {
      case UserRole.patient:
        return patientDashboard;
      case UserRole.admin:
        return adminDashboard;
      case UserRole.superAdmin:
        return superAdminDashboard;
    }
  }
}
