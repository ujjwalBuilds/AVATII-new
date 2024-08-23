class Vehicle {
   String? type;
   String? rcImage;
   String? registrationNumber;

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

  Map<String, dynamic> toJson() {
    return {
      'Type': type,
      'RcImage': rcImage,
      'RegistrationNumber': registrationNumber,
    };
  }
}

class DrivingLicense {
   String licenseNumber;
   String? image;

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

  Map<String, dynamic> toJson() {
    return {
      'LicenseNumber': licenseNumber,
      'Image': image,
    };
  }
}

class Driver {
   String? id;
   String? name;
   String? city;
   int? age;
   String? phoneNumber;
   Vehicle? vehicle;
   DrivingLicense? drivingLicense;
   String? profileUrl;
   bool? status;
   bool? approved;
   String? token;

  Driver({
     this.id,
   this.name,
     this.city,
   this.age,
     this.phoneNumber,
     this.vehicle,
     this.drivingLicense,
     this.profileUrl,
     this.status,
     this.approved,
   this.token,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['_id'],
      name: json['name'],
      city: json['city'],
      age: json['age'],
      phoneNumber: json['PhoneNumber'],
      vehicle: Vehicle.fromJson(json['vehicle']),
      drivingLicense: DrivingLicense.fromJson(json['drivingLicense']),
      profileUrl: json['profileUrl'],
      status: json['status'],
      approved: json['approved'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'city': city,
      'age': age,
      'PhoneNumber': phoneNumber,
      'vehicle': vehicle?.toJson(),
      'drivingLicense': drivingLicense?.toJson(),
      'profileUrl': profileUrl,
      'status': status,
      'approved': approved,
      'token': token,
    };
  }
}
