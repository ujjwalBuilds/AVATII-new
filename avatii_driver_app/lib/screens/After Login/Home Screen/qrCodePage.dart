import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QrCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: Image.asset('assets/images/qr code of avati app.jpg'), // Replace with your QR code image path
      ),
    );
  }
}
