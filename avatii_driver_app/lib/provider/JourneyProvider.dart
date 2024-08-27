import 'package:avatii_driver_app/Url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class JourneyProvider with ChangeNotifier {
  bool _isvalidtingotp = false;
  bool get isvalidatingotp => _isvalidtingotp;
  String? _validationMessage;

  String? get validationMessage => _validationMessage;

  Future<bool> validateOTP(String journeyId, String otp) async {
    final url = Uri.parse(Appurls.validateOTP); // Replace with your backend URL
    _isvalidtingotp = true;
    _validationMessage = null;  // Clear previous validation message
    notifyListeners();

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'journeyId': journeyId, 'otp': int.parse(otp)}),
      );

      final responseData = json.decode(response.body);
      _isvalidtingotp = false;
      notifyListeners();

      if (response.statusCode == 200) {
        _validationMessage = null;  // Clear validation message on success
        return true;
      } else {
        _validationMessage = responseData['message'] ?? 'Something went wrong';
        notifyListeners();
        return false;
      }
    } catch (error) {
      _validationMessage = 'Failed to validate OTP: $error';
      _isvalidtingotp = false;
      notifyListeners();
      return false;
    }
  }
}
