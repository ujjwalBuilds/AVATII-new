
import 'package:shared_preferences/shared_preferences.dart';

class Helperfunction {
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userid');
    return userId;
  }

  }