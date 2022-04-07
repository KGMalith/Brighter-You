import 'dart:convert';

import 'package:brighter_you/config.dart';
import 'package:brighter_you/models/login_request_model.dart';
import 'package:brighter_you/models/career_request_model.dart';
import 'package:http/http.dart' as http;

import '../models/register_request_model.dart';

class APIService {
  static var client = http.Client();

  static Future<Object> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var url = Uri.http(Config.apiBaseUrl, Config.sigininUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return response.body;
  }

  static Future<Object> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var url = Uri.http(Config.apiBaseUrl, Config.signupUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return response.body;
  }

  static Future<Object> career(CareerRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var url = Uri.http(Config.apiBaseUrl, Config.signupUrl); // This need to be changed
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return response.body;
  }
}
