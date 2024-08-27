import 'dart:convert';
import 'package:avatii/url.dart';
import 'package:http/http.dart' as http;
import 'package:avatii/models/costmodel.dart';
import 'package:flutter/material.dart';
class CostingProvider with ChangeNotifier {
  final Map<String, Cost> _costData = {};

  Map<String, Cost> get costData => _costData;

  Future<void> fetchCosting() async {
    try {
      final vehicleTypes = ['Car', 'Auto', 'Bike'];
      for (String type in vehicleTypes) {
        final response = await http.get(Uri.parse('${Appurls.getcost}?VehicleType=$type'));

        if (response.statusCode == 200) {
          final List<dynamic> jsonData = json.decode(response.body);
          
          if (jsonData.isNotEmpty) {
            _costData[type] = Cost.fromJson(jsonData[0]);
          }
        } else {
          throw Exception('Failed to load costing');
        }
      }
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
