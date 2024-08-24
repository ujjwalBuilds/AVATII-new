import 'package:avatii/models/ride_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class RideProvider with ChangeNotifier {
  late IO.Socket _socket;
  bool _rideRequested = false;

  bool get rideRequested => _rideRequested;

  RideProvider() {
    _initializeSocket();
  }

  void _initializeSocket() {
    _socket = IO.io(, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    _socket.connect();

    _socket.onConnect((_) {
      print('Connected to the server......................');
    });

    _socket.on('rideAccepted', (data) {
      // Handle ride acceptance here
      print('Ride accepted by driver: ${data['driverId']}');
      // Perform necessary UI updates
    });
  }

  void requestRide(RideRequest rideRequest) {
    _socket.emit('requestRide', rideRequest.toJson());
    _rideRequested = true;
    notifyListeners();
  }
}
