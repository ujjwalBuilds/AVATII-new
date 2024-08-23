import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Upload Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageUploadTestPage(),
    );
  }
}
class ImageUploadTestPage extends StatefulWidget {
  @override
  _ImageUploadTestPageState createState() => _ImageUploadTestPageState();
}

class _ImageUploadTestPageState extends State<ImageUploadTestPage> {
  File? _image;
  final picker = ImagePicker();
  String? _imageUrl;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      print('No image to upload.');
      return;
    }

    try {
      var uri = Uri.parse('http://192.168.0.104:3002/api/image/upload'); // Replace with your backend URL
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

      var response = await request.send();
      var responseData = await http.Response.fromStream(response);

      if (response.statusCode == 201) {
        var jsonResponse = json.decode(responseData.body);
        setState(() {
          _imageUrl = jsonResponse['imageUrl'];
        });
        print('Image uploaded successfully: $_imageUrl');
      } else {
        print('Failed to upload image: ${responseData.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(
                    _image!,
                    height: 200,
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
            SizedBox(height: 20),
            _imageUrl == null
                ? Text('No image uploaded yet.')
                : Text('Uploaded Image URL: $_imageUrl'),
          ],
        ),
      ),
    );
  }
}
