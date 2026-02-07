// lib/data/models/doctor_model.dart
class DoctorModel {
  final String id;
  final String userId;
  final String name;
  final String specialty;
  final String licenseNumber;
  final int yearsOfExperience;
  final double rating;
  final int totalReviews;
  final String bio;
  final List<String> qualifications;
  final bool isAvailable;
  final String? profileImage;

  DoctorModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.specialty,
    required this.licenseNumber,
    required this.yearsOfExperience,
    required this.rating,
    required this.totalReviews,
    required this.bio,
    required this.qualifications,
    required this.isAvailable,
    this.profileImage,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      specialty: json['specialty'],
      licenseNumber: json['licenseNumber'],
      yearsOfExperience: json['yearsOfExperience'],
      rating: json['rating'].toDouble(),
      totalReviews: json['totalReviews'],
      bio: json['bio'],
      qualifications: List<String>.from(json['qualifications']),
      isAvailable: json['isAvailable'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'specialty': specialty,
      'licenseNumber': licenseNumber,
      'yearsOfExperience': yearsOfExperience,
      'rating': rating,
      'totalReviews': totalReviews,
      'bio': bio,
      'qualifications': qualifications,
      'isAvailable': isAvailable,
      'profileImage': profileImage,
    };
  }
}
