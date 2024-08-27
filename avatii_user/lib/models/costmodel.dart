class Cost {
  final String id;
  final String vehicleType;
  final double initialCost;
  final double costPerKilometre;
  final DateTime createdAt;
  final DateTime updatedAt;

  Cost({
    required this.id,
    required this.vehicleType,
    required this.initialCost,
    required this.costPerKilometre,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cost.fromJson(Map<String, dynamic> json) {
    return Cost(
      id: json['_id'],
      vehicleType: json['VehicleType'],
      initialCost: double.parse(json['InitialCost']),
      costPerKilometre: double.parse(json['CostPerKilometre']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
