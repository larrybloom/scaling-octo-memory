// lib/presentation/providers/appointment_provider.dart
import 'package:flutter/foundation.dart';
import '../../data/models/appointment_model.dart';

class AppointmentProvider with ChangeNotifier {
  List<AppointmentModel> _appointments = [];
  bool _isLoading = false;

  List<AppointmentModel> get appointments => _appointments;
  bool get isLoading => _isLoading;

  Future<bool> bookAppointment({
    required String patientId,
    required String doctorId,
    required DateTime appointmentDate,
    required String timeSlot,
    required ConsultationType consultationType,
    String? notes,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement actual API call to your C# backend
      await Future.delayed(const Duration(seconds: 2));

      final appointment = AppointmentModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        patientId: patientId,
        doctorId: doctorId,
        appointmentDate: appointmentDate,
        timeSlot: timeSlot,
        consultationType: consultationType,
        status: AppointmentStatus.scheduled,
        notes: notes,
        createdAt: DateTime.now(),
      );

      _appointments.add(appointment);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> fetchAppointments(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement actual API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock data
      _appointments = [];
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> cancelAppointment(String appointmentId) async {
    try {
      // TODO: Implement actual API call
      await Future.delayed(const Duration(seconds: 1));
      
      _appointments.removeWhere((a) => a.id == appointmentId);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
