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

  Driver? _driver;

  Driver? get driver => _driver;
Future<void> registerDriver(Driver driver) async {
  final url = Uri.parse(Appurls.registerDriver); // Replace with your actual API URL
_isLoading=true;
notifyListeners();


  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        driver.toJson()
       
      ),
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

Future<void> registerwithImage(Driver driver ,File? rcimage,File? 
liscenceImage,File? profileimage
 )async{
  try{
_isLoading=true;
notifyListeners();


String? profileImage=await Helperfunction.uploadImage(profileimage);
print('1...............................');
String? rcImage=await Helperfunction.uploadImage(rcimage);
print('2.............................');
String? LicenceImage=await Helperfunction.uploadImage(liscenceImage);
print('3....................');


driver.profileUrl=profileImage;


driver.vehicle?.rcImage=rcImage;
driver.drivingLicense?.image=LicenceImage;


await registerDriver(driver); 


  }catch(error){
    print('imagee upload error..........................................');
    print(error.toString());
        _isLoading=false;
        notifyListeners();
        throw error;
  }


}







 Future<void> loginDriver(String phoneNumber) async {
    final url = Uri.parse('https://your-api-url.com/loginDriver'); // Replace with your actual API URL

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'PhoneNumber': phoneNumber,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        _driverId = responseData['_id'];
        _driverName = responseData['name'];
        _phoneNumber = responseData['PhoneNumber'];
        _token = responseData['token'];

        // Save data locally
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        await prefs.setString('driverId', _driverId!);
        await prefs.setString('driverName', _driverName!);
        await prefs.setString('phoneNumber', _phoneNumber!);

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

  String? get token => _token;
  String? get driverId => _driverId;
  String? get driverName => _driverName;
  String? get phoneNumber => _phoneNumber;

  // Logout driver and clear local storage
  Future<void> logout() async {
    _token = null;
    _driverId = null;
    _driverName = null;
    _phoneNumber = null;

    // Clear data from local storage
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('driverId');
    await prefs.remove('driverName');
    await prefs.remove('phoneNumber');

    notifyListeners();
  }




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









}