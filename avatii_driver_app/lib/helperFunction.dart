import 'dart:convert';
import 'dart:io';
import 'package:avatii_driver_app/Url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helperfunction {

 static Future<String?> uploadImage(File? image) async {
    if (image != Null) {
      print("image is here");
    }
    var uri =
        Uri.parse(Appurls.uploadimageurl);

    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('image', image!.path));

    var response = await request.send();
    var responseData = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(responseData.body);
      print("succesfull");
      print(jsonResponse['imageUrl']);
      return jsonResponse['imageUrl'];
    } else {
      print("Failed${responseData.body}");
    }
  }






}
