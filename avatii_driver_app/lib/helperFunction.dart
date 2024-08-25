import 'dart:convert';
import 'dart:io';
import 'package:avatii_driver_app/Url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helperfunction {

//  static Future<String?> uploadImage(File? image) async {
//     try{
//     if (image != Null) {
//       print("image is here");
//     }
//     var uri =
//         Uri.parse(Appurls.uploadimageurl);

//     var request = http.MultipartRequest('POST', uri);
//     request.files.add(await http.MultipartFile.fromPath('image', image!.path));

//     var response = await request.send();
//     var responseData = await http.Response.fromStream(response);

//     if (response.statusCode == 200) {
//       var jsonResponse = json.decode(responseData.body);
//       print("succesfull");
//       print(jsonResponse['imageUrl']);
//       return jsonResponse['imageUrl'];
//     } else {
//       print('${response.statusCode}');
//       print("Failed${responseData.body}");
      
//     }
//   }catch(error){
//   throw Exception(error);
//  }

//  }

 static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('driverId');
    return userId;
  }

static Future<String?> uploadImage(File? image) async {
  if (image == null) {
    print("No image selected");
    return null;
  }

  try {
    var uri = Uri.parse(Appurls.uploadimageurl);
    var request = http.MultipartRequest('POST', uri);

    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();
    var responseData = await http.Response.fromStream(response);

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${responseData.body}");

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(responseData.body);
      print("Image uploaded successfully");
      print("Image URL: ${jsonResponse['imageUrl']}");
      return jsonResponse['imageUrl'];
    } else {
      print("Failed to upload image. Status code: ${response.statusCode}");
      print("Response: ${responseData.body}");
      return null;
    }
  } catch (e) {
    print("Error uploading image: $e");
    return null;
  }}



}
