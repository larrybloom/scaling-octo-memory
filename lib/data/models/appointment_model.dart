// lib/data/models/appointment_model.dart
class AppointmentModel {
  final String id;
  final String patientId;
  final String doctorId;
  final DateTime appointmentDate;
  final String timeSlot;
  final ConsultationType consultationType;
  final AppointmentStatus status;
  final String? notes;
  final String? meetingLink;
  final DateTime createdAt;

  AppointmentModel({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.appointmentDate,
    required this.timeSlot,
    required this.consultationType,
    required this.status,
    this.notes,
    this.meetingLink,
    required this.createdAt,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      patientId: json['patientId'],
      doctorId: json['doctorId'],
      appointmentDate: DateTime.parse(json['appointmentDate']),
      timeSlot: json['timeSlot'],
      consultationType: ConsultationType.values.firstWhere(
        (e) => e.toString() == 'ConsultationType.${json['consultationType']}',
      ),
      status: AppointmentStatus.values.firstWhere(
        (e) => e.toString() == 'AppointmentStatus.${json['status']}',
      ),
      notes: json['notes'],
      meetingLink: json['meetingLink'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'doctorId': doctorId,
      'appointmentDate': appointmentDate.toIso8601String(),
      'timeSlot': timeSlot,
      'consultationType': consultationType.toString().split('.').last,
      'status': status.toString().split('.').last,
      'notes': notes,
      'meetingLink': meetingLink,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

enum ConsultationType {
  videoCall,
  audioCall,
  chat,
}

enum AppointmentStatus {
  scheduled,
  inProgress,
  completed,
  cancelled,
  noShow,
}
