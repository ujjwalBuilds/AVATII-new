import 'package:avatii_driver_app/screens/After%20Login/Home%20Screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusCheckPage extends StatefulWidget {
  @override
  _StatusCheckPageState createState() => _StatusCheckPageState();
}

class _StatusCheckPageState extends State<StatusCheckPage> {
  int? approvedStatus;

  @override
  void initState() {
    super.initState();
    _checkApprovalStatus();
  }

  Future<void> _checkApprovalStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? status = prefs.getInt('approved');

    setState(() {
      approvedStatus = status;
    });

    if (status == 1) {
      _navigateToHomeScreen();
    }
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen()), // Replace with your actual HomeScreen widget
    );
  }

  @override
  Widget build(BuildContext context) {
    if (approvedStatus == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: _buildAlertBoxContent(),
        ),
      ),
    );
  }

  Widget _buildAlertBoxContent() {
    switch (approvedStatus) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.info_outline, color: Colors.blue, size: 48),
            SizedBox(height: 16),
            Text(
              'Application request is pending.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => exitApp(),
              child: Text('Close App'),
            ),
          ],
        );
      case 2:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 48),
            SizedBox(height: 16),
            Text(
              'Application denied.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => exitApp(),
              child: Text('Close App'),
            ),
          ],
        );
      default:
        return SizedBox.shrink(); // Should never reach here
    }
  }

  void exitApp() {
    // Use this to exit the app
    Navigator.of(context).pop(true);
  }
}

