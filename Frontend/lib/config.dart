import 'package:flutter/cupertino.dart';

class Config {
  static const String apiBaseUrl =
      '10.0.2.2:1337'; // to run in web =>127.0.0.1  to run in emulator =>10.0.2.2

  //auth urls
  static const String sigininUrl = '/api/auth/signin';
  static const String signupUrl = '/api/auth/signup';

  //question urls
  static const String getAnswers = '/api/questions/get-answers';
  static const String deleteAnswers = '/api/questions/delete-saved-answers';
  static const String saveAnswers = '/api/questions/save-answers';
  static const String getAllSavedAnswers =
      '/api/questions/get-all-saved-answers';
  static const String getSavedAnswer = '/api/questions/get-saved-answers';

  //vehicle urls

  //health urls

  //career urls
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeH;
  static double? blockSizeV;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeV = screenWidth! / 100;
    blockSizeH = screenHeight! / 100;
  }
}
