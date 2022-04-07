import 'package:flutter/cupertino.dart';

class Config {
  static const String apiBaseUrl =
      '127.0.0.1:1337'; // to run in web =>127.0.0.1  to run in emulator =>10.0.2.2

  //auth urls
  static const String sigininUrl = '/api/auth/signin';
  static const String signupUrl = '/api/auth/signup';

  //question urls

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
