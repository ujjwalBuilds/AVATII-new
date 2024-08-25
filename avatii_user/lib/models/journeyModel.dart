// journey_model.dart
class Journey {
  String? id;
  String? passengerId;
  String? driverId;
  String? pickOff;
  String? dropOff;
  double? distance;
  String? otp;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Journey({
    this.id,
    this.passengerId,
    this.driverId,
    this.pickOff,
    this.dropOff,
    this.distance,
    this.otp,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      id: json['_id'],
      passengerId: json['passengerId'],
      driverId: json['driverId'],
      pickOff: json['pickOff'],
      dropOff: json['dropOff'],
      distance: json['distance'] != null ? (json['distance'] as num).toDouble() : null,
      otp: json['otp']?.toString(),
      status: json['status'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}