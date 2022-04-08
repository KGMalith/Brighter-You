import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:brighter_you/config.dart';
import 'package:brighter_you/models/save_health_answers_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HealthApiService {
  static var client = http.Client();

  static Future<Object> saveAnswer(SaveHealthRequestModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("Bearer_Token");
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var url = Uri.http(Config.apiBaseUrl, Config.saveAnswers);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJsonAdd()));

    return response.body;
  }
}
