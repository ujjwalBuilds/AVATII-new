import 'package:avatii_driver_app/Url.dart';
import 'package:avatii_driver_app/model/Ride_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class RideRequestProvider with ChangeNotifier {
  late IO.Socket _socket;
  List<RideRequest> _rideRequests = [];

  List<RideRequest> get rideRequests => _rideRequests;

  RideRequestProvider() {
    _initializeSocket();
  }

  void _initializeSocket() {
    _socket = IO.io(Appurls.baseurl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    _socket.connect();

    _socket.onConnect((_) {
      print('Connected to the server');
    });

    _socket.on('rideRequest', (data) {
      final rideRequest = RideRequest.fromJson(data);
      _rideRequests.add(rideRequest);
      notifyListeners();
    });
  }

  void acceptRide(RideRequest rideRequest) {
    _socket.emit('acceptRide', {
      'driverId': 'driver123',
      'userId': rideRequest.userId,
      'journeyId': 'journey123',
    });
  }
}
