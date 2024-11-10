import 'dart:convert';
import 'dart:io';

import 'package:avatii_driver_app/Url.dart';
import 'package:avatii_driver_app/helperFunction.dart';
import 'package:avatii_driver_app/model/driver_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DriverauthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get isAuth => _token != null;

  Driver? _driver;

  // List of test phone numbers
  final List<String> testNumbers = [
    '+16505550000',
    '+16505551111',
    '+16505552222',
  ];

  // Function to check if the number is a test number
  bool isTestNumber(String number) {
    // Clean the phone number (remove any spaces, dashes, or special characters)
    String cleanNumber = number.replaceAll(RegExp(r'[\s-]'), '');
    return testNumbers.contains(cleanNumber);
  }

  Driver? get driver => _driver;
  Future<void> registerDriver(Driver driver) async {
    final url = Uri.parse(Appurls.registerDriver); // Replace with your actual API URL
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode(driver.toJson()),
      );
      _isLoading = false;
      notifyListeners();

      if (response.statusCode == 201) {
        print('Driver Regiseteration successfull..................................................');
        print(response.body);
        // final responseData = json.decode(response.body);

        // _driver = Driver.fromJson(responseData);

        notifyListeners();
      } else {
        final errorData = json.decode(response.body);
        print('Failed to register driver ......${response.statusCode}...${response.body}');
        throw Exception(errorData['message']);
      }
    } catch (error) {
      print('failed  to register driver.............');
      throw error;
    }
  }

  Future<void> registerwithImage(Driver driver, File? rcimage, File? liscenceImage, File? profileimage) async {
    try {
      _isLoading = true;
      notifyListeners();

      String? profileImage = await Helperfunction.uploadImage(profileimage);
      print('1...............................');
      String? rcImage = await Helperfunction.uploadImage(rcimage);
      print('2.............................');
      String? LicenceImage = await Helperfunction.uploadImage(liscenceImage);
      print('3....................');

      driver.profileUrl = profileImage;

      driver.vehicle?.rcImage = rcImage;
      driver.drivingLicense?.image = LicenceImage;

      await registerDriver(driver);
    } catch (error) {
      print('imagee upload error..........................................');
      print(error.toString());
      _isLoading = false;
      notifyListeners();
      throw error;
    }
  }

  // Future<void> loginDriver(String phoneNumber) async {
  //   final url = Uri.parse(Appurls.LoginDriver); // Replace with your actual API URL
  //   _isLoading = true;
  //   notifyListeners();
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Content-Type': 'application/json'
  //       },
  //       body: json.encode({
  //         'PhoneNumber': phoneNumber,
  //       }),
  //     );
  //     _isLoading = false;
  //   notifyListeners();

  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);
  //       print('Login successfull.................................');
  //       print(response.body);

  //       _driverId = responseData['_id'];
  //       _driverName = responseData['name'];
  //       _phoneNumber = responseData['PhoneNumber'];
  //       _token = responseData['token'];
  //       _approved = responseData['approved'];

  //       // Save data locally
  //       final prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('token', _token!);
  //       await prefs.setString('driverId', _driverId!);
  //       await prefs.setString('driverName', _driverName!);
  //       await prefs.setString('phoneNumber', _phoneNumber!);
  //       await prefs.setInt('approved', _approved!);

  //       notifyListeners();
  //     } else {
  //       final errorData = json.decode(response.body);
  //       throw Exception(errorData['message']);
  //     }
  //   } catch (error) {
  //     throw error;
  //   }
  // }


  Future<void> loginDriver(String phoneNumber) async {
    // Check if the phone number is a test number
    if (isTestNumber(phoneNumber)) {
      print("Logging in as test driver: $phoneNumber");
      // Simulate a successful login for test numbers
      _driverId = "test_id"; // Dummy driver ID
      _driverName = "Test Driver";
      _phoneNumber = phoneNumber;
      _token = "test_token"; // Dummy token
      _approved = 1; // Dummy approved value

      // Save data locally
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setString('driverId', _driverId!);
      await prefs.setString('driverName', _driverName!);
      await prefs.setString('phoneNumber', _phoneNumber!);
      await prefs.setInt('approved', _approved!);

      // Return early since it's a test number
      notifyListeners();
      return Future.value(); // Skip actual API call for test numbers
    }

    // Normal login process for regular users
    final url = Uri.parse(Appurls.LoginDriver); // Replace with your actual API URL
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'PhoneNumber': phoneNumber,
        }),
      );

      _isLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Login successful: ${response.body}');

        _driverId = responseData['_id'];
        _driverName = responseData['name'];
        _phoneNumber = responseData['PhoneNumber'];
        _token = responseData['token'];
        _approved = responseData['approved'];

        // Save data locally
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        await prefs.setString('driverId', _driverId!);
        await prefs.setString('driverName', _driverName!);
        await prefs.setString('phoneNumber', _phoneNumber!);
        await prefs.setInt('approved', _approved!);

        notifyListeners();
      } else {
        final errorData = json.decode(response.body);
        throw Exception(errorData['message']);
      }
    } catch (error) {
      throw error;
    }
  }


  String? _token;
  String? _driverId;
  String? _driverName;
  String? _phoneNumber;
  int? _approved;

  String? get token => _token;
  String? get driverId => _driverId;
  String? get driverName => _driverName;
  String? get phoneNumber => _phoneNumber;


  Map<String, dynamic> decodeJWT(String token) {
    final parts = token.split('.');
    assert(parts.length == 3);

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!');
    }
    return utf8.decode(base64Url.decode(output));
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) return;

    // Optionally, verify the token with your backend here
    _token = prefs.getString('token');
    notifyListeners();
  }
   Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    //_clearCacheOnLogout();
    notifyListeners();
    //return true;
  }
  
}
