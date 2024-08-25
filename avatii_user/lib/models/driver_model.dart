// driver_model.dart
class Vehicle {
  final String type;
  final String rcImage;
  final String registrationNumber;

  Vehicle({
    required this.type,
    required this.rcImage,
    required this.registrationNumber,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      type: json['Type'],
      rcImage: json['RcImage'],
      registrationNumber: json['RegistrationNumber'],
    );
  }
}

class DrivingLicense {
  final String licenseNumber;
  final String image;

  DrivingLicense({
    required this.licenseNumber,
    required this.image,
  });

  factory DrivingLicense.fromJson(Map<String, dynamic> json) {
    return DrivingLicense(
      licenseNumber: json['LicenseNumber'],
      image: json['Image'],
    );
  }
}

class Driver {
   String? id;
  String? name;
   String? city;
   int? age;
   String? phoneNumber;
  Vehicle vehicle;
   DrivingLicense drivingLicense;
   String? profileUrl;
   bool? status;
   int? approved;
  final DateTime createdAt;
  final DateTime updatedAt;

  Driver({
    required this.id,
    required this.name,
    required this.city,
    required this.age,
    required this.phoneNumber,
    required this.vehicle,
    required this.drivingLicense,
    required this.profileUrl,
    required this.status,
    required this.approved,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['_id']??'',
      name: json['name']??'',
      city: json['city']??'',
      age: json['age']??'',
      phoneNumber: json['PhoneNumber']??'',
      vehicle: Vehicle.fromJson(json['vehicle']),
      drivingLicense: DrivingLicense.fromJson(json['drivingLicense']),
      profileUrl: json['profileUrl']??'',
      status: json['status']??'',
      approved: json['approved']??'',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}