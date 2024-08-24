class RideRequest {
  String? userId;
  final Map<String, double> currentLocation;
  final Map<String, double> destinationLocation;

  RideRequest({
    required this.userId,
    required this.currentLocation,
    required this.destinationLocation,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'currentLocation': currentLocation,
        'destinationLocation': destinationLocation,
      };
}
