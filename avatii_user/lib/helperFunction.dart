// import 'package:avatii/models/journeyModel.dart';
// import 'package:avatii/models/journeyModel.dart';
// import 'package:avatii/models/journeyModel.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'models/journeyModel.dart';

// class Helperfunction {
//   static Future<String?> getUserId() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? userId = prefs.getString('userid');
//     return userId;
//   }

//   void useCoordinates() {
//   // Extract pickup coordinates
//   journey.Location? pickOffCoordinates = widget.journey?.pickOff;
//   double pickupLatitude = pickOffCoordinates?.latitude ?? widget.currentLocation['latitude'] ?? 0.0;
//   double pickupLongitude = pickOffCoordinates?.longitude ?? widget.currentLocation['longitude'] ?? 0.0;

//   // Extract dropoff coordinates
//   LatLng dropOffLatLng = widget.destinationCoordinates ??
//       LatLng(
//         widget.journey?.dropOff?.latitude ?? widget.currentLocation['latitude'] ?? 0.0,
//         widget.journey?.dropOff?.longitude ?? widget.currentLocation['longitude'] ?? 0.0,
//       );
//   double dropoffLatitude = dropOffLatLng.latitude;
//   double dropoffLongitude = dropOffLatLng.longitude;

//   // Use the coordinates as needed
//   print('Pickup: $pickupLatitude, $pickupLongitude');
//   print('Dropoff: $dropoffLatitude, $dropoffLongitude');

//   // Add your custom logic here
// }

// Future<Map<String, double>> calculateDistance(
//       double startLatitude,
//       double startLongitude,
//       double endLatitude,
//       double endLongitude,
//       ) async {
//     double distanceInMeters = Geolocator.distanceBetween(
//       startLatitude,
//       startLongitude,
//       endLatitude,
//       endLongitude,
//     );

//     double distanceInKilometers = distanceInMeters / 1000;

//     return {
//       'meters': distanceInMeters,
//       'kilometers': distanceInKilometers,
//     };
//   }

//   double fareCalculator(String vehicleType, double distanceInKilometers) {
//   double fare = 0;

//   switch (vehicleType.toLowerCase()) {
//     case 'car':
//       // First 2 km cost is fixed at 40 Rs
//       if (distanceInKilometers <= 2) {
//         fare = 40;
//       } else {
//         // 40 Rs for the first 2 km + 12 Rs per additional km
//         fare = 40 + ((distanceInKilometers - 2) * 12);
//       }
//       break;

//     case 'auto':
//       // First 2 km cost is fixed at 30 Rs
//       if (distanceInKilometers <= 2) {
//         fare = 30;
//       } else {
//         // 30 Rs for the first 2 km + 8 Rs per additional km
//         fare = 30 + ((distanceInKilometers - 2) * 8);
//       }
//       break;

//     case 'bike':
//       // First 2 km cost is fixed at 20 Rs
//       if (distanceInKilometers <= 2) {
//         fare = 20;
//       } else {
//         // 20 Rs for the first 2 km + 6 Rs per additional km
//         fare = 20 + ((distanceInKilometers - 2) * 6);
//       }
//       break;

//     default:
//       throw Exception('Invalid vehicle type');
//   }

//   return fare;
// }

//   }

import 'package:avatii/models/journeyModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelperFunction {
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userid');
    return userId;
  }
  static Future<double> calculateFare(
    Map<String, double> pickoffcoordinates,
    Map<String, double> dropoffcoordinates,
    String vehicleType,
    // Map<String, double> currentLocation,
    double initialCost,
    double perKilometreCost,
  ) async {
    // Extract pickup coordinates
    double? pickupLatitude = pickoffcoordinates['latitude'];
    double? pickupLongitude = pickoffcoordinates['longitude'];

    // Extract dropoff coordinates
    double? dropoffLatitude = dropoffcoordinates['latitude'];
    double? dropoffLongitude = dropoffcoordinates['longitude'];

    // Calculate distance
    Map<String, double> distanceResult = await calculateDistance(
      pickupLatitude!,
      pickupLongitude!,
      dropoffLatitude!,
      dropoffLongitude!,
    );

    // Calculate fare based on distance, vehicle type, and cost parameters
    double fare = fareCalculator(initialCost, perKilometreCost, distanceResult['kilometers']!);

    return fare;
  }

  static Future<Map<String, double>> calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) async {
    double distanceInMeters = await Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );

    double distanceInKilometers = distanceInMeters / 1000;

    return {
      'meters': distanceInMeters,
      'kilometers': distanceInKilometers,
    };
  }

  static double fareCalculator(double initialCost, double perKilometreCost, double distanceInKilometers) {
    double fare;

    // If the distance is less than or equal to 2 km, the fare is the initial cost
    if (distanceInKilometers <= 2) {
      fare = initialCost;
    } else {
      // If the distance is greater than 2 km, calculate the fare as initial cost + additional cost per km
      fare = initialCost + ((distanceInKilometers - 2) * perKilometreCost);
    }

    return fare;
  }
}
