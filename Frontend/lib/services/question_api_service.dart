import 'dart:convert';

import 'package:brighter_you/config.dart';
import 'package:brighter_you/models/get_question_request_model.dart';
import 'package:brighter_you/models/login_request_model.dart';
import 'package:brighter_you/models/save_question_request_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/register_request_model.dart';

class QuestionAPIService {
  static var client = http.Client();

  static Future<Object> generateQuestions(
      GetQuestionsRequestModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("Bearer_Token");

    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var url = Uri.http(Config.apiBaseUrl, Config.getAnswers);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return response.body;
  }

  static Future<Object> saveAnswer(SaveQuestionsRequestModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("Bearer_Token");
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var url = Uri.http(Config.apiBaseUrl, Config.saveAnswers);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return response.body;
  }

  static Future<Object> deleteAnswer(RegisterRequestModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("Bearer_Token");
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var url = Uri.http(Config.apiBaseUrl, Config.deleteAnswers);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return response.body;
  }

  static Future<Object> getAllSavedAnswers(RegisterRequestModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("Bearer_Token");
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var url = Uri.http(Config.apiBaseUrl, Config.getAllSavedAnswers);
    var response = await client.get(url, headers: requestHeaders);

    return response.body;
  }

  static Future<Object> getSavedAnswer(RegisterRequestModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("Bearer_Token");
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var url = Uri.http(Config.apiBaseUrl, Config.getSavedAnswer);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return response.body;
  }
}
