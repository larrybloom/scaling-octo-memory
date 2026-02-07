// lib/presentation/providers/doctor_provider.dart
import 'package:flutter/foundation.dart';
import '../../data/models/doctor_model.dart';

class DoctorProvider with ChangeNotifier {
  List<DoctorModel> _doctors = [];
  bool _isLoading = false;

  List<DoctorModel> get doctors => _doctors;
  List<DoctorModel> get availableDoctors => 
      _doctors.where((d) => d.isAvailable).toList();
  bool get isLoading => _isLoading;

  Future<void> fetchDoctors() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement actual API call to your C# backend
      await Future.delayed(const Duration(seconds: 2));

      // Mock data
      _doctors = [
        DoctorModel(
          id: '1',
          userId: '1',
          name: 'Dr. Sarah Johnson',
          specialty: 'Cardiologist',
          licenseNumber: 'MD12345',
          yearsOfExperience: 15,
          rating: 4.8,
          totalReviews: 156,
          bio: 'Experienced cardiologist specializing in heart disease prevention.',
          qualifications: ['MBBS', 'MD Cardiology', 'Fellowship'],
          isAvailable: true,
        ),
        DoctorModel(
          id: '2',
          userId: '2',
          name: 'Dr. Michael Chen',
          specialty: 'Pediatrician',
          licenseNumber: 'MD12346',
          yearsOfExperience: 12,
          rating: 4.9,
          totalReviews: 203,
          bio: 'Dedicated pediatrician with focus on child healthcare.',
          qualifications: ['MBBS', 'MD Pediatrics'],
          isAvailable: true,
        ),
        DoctorModel(
          id: '3',
          userId: '3',
          name: 'Dr. Emily Davis',
          specialty: 'Dermatologist',
          licenseNumber: 'MD12347',
          yearsOfExperience: 8,
          rating: 4.7,
          totalReviews: 98,
          bio: 'Specialist in skin conditions and cosmetic dermatology.',
          qualifications: ['MBBS', 'MD Dermatology'],
          isAvailable: false,
        ),
      ];

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<DoctorModel?> getDoctorById(String doctorId) async {
    try {
      return _doctors.firstWhere((d) => d.id == doctorId);
    } catch (e) {
      return null;
    }
  }

  List<DoctorModel> searchDoctors(String query) {
    if (query.isEmpty) return _doctors;
    
    return _doctors.where((doctor) {
      return doctor.name.toLowerCase().contains(query.toLowerCase()) ||
             doctor.specialty.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  List<DoctorModel> filterBySpecialty(String specialty) {
    if (specialty.isEmpty) return _doctors;
    
    return _doctors.where((doctor) {
      return doctor.specialty.toLowerCase() == specialty.toLowerCase();
    }).toList();
  }
}
