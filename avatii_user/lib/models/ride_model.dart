// class RideRequest {
//   final String userId;
//   final Map<String, double> currentLocation;
//   final Map<String, double> destinationLocation;

//   RideRequest({
//     required this.userId,
//     required this.currentLocation,
//     required this.destinationLocation,
//   });

//   factory RideRequest.fromJson(Map<String, dynamic> json) {
//     return RideRequest(
//       userId: json['userId'],
//       currentLocation: Map<String, double>.from(json['currentLocation']),
//       destinationLocation: Map<String, double>.from(json['destinationLocation']),
//     );
//   }
// }

class RideRequest {
  final String userId;
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