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

 bool isCompletingJourney = false;
 bool get iscomplete=>isCompletingJourney;
  String? completionErrorMessage;

  Future<bool> completeJourney(String journeyId) async {

    print("is ${journeyId}.....................................this is my journey id ");
    isCompletingJourney = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(Appurls.EndRide),
        headers: {
        'Content-Type': 'application/json',
      },
         // Replace with your actual endpoint
        body:json.encode({'journeyId': journeyId}),
      );

      if (response.statusCode == 200) {
        isCompletingJourney = false;
        notifyListeners();
        return true;
      } else {
        print('failed to complete a journey.................................................${response.statusCode}.........${response.body}');
        completionErrorMessage = 'Failed to complete the journey';
        isCompletingJourney = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      completionErrorMessage = 'An error occurred';
      isCompletingJourney = false;
      notifyListeners();
      return false;
    }
  }



}
