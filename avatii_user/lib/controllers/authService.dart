import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String apiUrl = "http://localhost:3001/auth";

  static Future<void> sendOtp(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('$apiUrl/signinup/code'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phoneNumber': phoneNumber}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send OTP');
    }
  }

  static Future<void> verifyOtp(String phoneNumber, String otp) async {
    final response = await http.post(
      Uri.parse('$apiUrl/signinup/code/consume'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phoneNumber': phoneNumber, 'userInputCode': otp}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to verify OTP');
    }
  }
}
