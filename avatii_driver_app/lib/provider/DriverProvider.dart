

import 'package:avatii_driver_app/Url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DriverProvider with ChangeNotifier {
  bool _isLoading = false;
  String _statusMessage = '';

  bool get isLoading => _isLoading;
  String get statusMessage => _statusMessage;

  Future<void> changeDriverStatus() async {
    _isLoading = true;
    notifyListeners();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? driverId = prefs.getString('driverId'); // Assuming 'driverId' is the key used to store the driver's ID.

      if (driverId == null) {
        _statusMessage = 'Driver ID not found';
        _isLoading = false;
        notifyListeners();
        return;
      }

      final url = Uri.parse(Appurls.changeDriverStatus); // Replace with your actual backend URL
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'id': driverId,
        }),
      );

      if (response.statusCode == 200) {
        _statusMessage = 'Driver approved successfully';
     print('successfully change the status of the driver.....');


      } else {
        final responseData = json.decode(response.body);
        _statusMessage = responseData['message'] ?? 'Failed to change status';
      }
    } catch (error) {
      _statusMessage = 'An error occurred: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
