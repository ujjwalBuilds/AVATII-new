class Location {
  final double latitude;
  final double longitude;
  final String id;

  Location({required this.latitude, required this.longitude, required this.id});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      '_id': id,
    };
  }

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude, id: $id)';
  }
}

class Journey {
  final String id;
  final String passengerId;
  final String driverId;
  final Location pickOff;
  final Location dropOff;
  final double distance;
  final int otp;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Journey({
    required this.id,
    required this.passengerId,
    required this.driverId,
    required this.pickOff,
    required this.dropOff,
    required this.distance,
    required this.otp,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      id: json['_id'],
      passengerId: json['passengerId'],
      driverId: json['driverId'],
      pickOff: Location.fromJson(json['pickOff']),
      dropOff: Location.fromJson(json['dropOff']),
      distance: json['distance'],
      otp: json['otp'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'passengerId': passengerId,
      'driverId': driverId,
      'pickOff': pickOff.toJson(),
      'dropOff': dropOff.toJson(),
      'distance': distance,
      'otp': otp,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }

  @override
  String toString() {
    return 'Journey(id: $id, passengerId: $passengerId, driverId: $driverId, pickOff: $pickOff, dropOff: $dropOff, distance: $distance, otp: $otp, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }
}
