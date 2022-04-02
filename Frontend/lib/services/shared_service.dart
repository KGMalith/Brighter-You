import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:brighter_you/models/login_response_model.dart';
import 'package:flutter/cupertino.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExists =
        await APICacheManager().isAPICacheKeyExist("Bearer_Token");

    return isKeyExists;
  }

  static Future<Object?> loginDetails() async {
    var isKeyExists =
        await APICacheManager().isAPICacheKeyExist("Bearer_Token");

    if (isKeyExists) {
      var cacheData = await APICacheManager().getCacheData("Bearer_Token");
      return loginReponseJson(cacheData.syncData);
    }
  }

  static Future<void> setLoginDetails(Object model) async {
    // APICacheDBModel cacheDBModel = APICacheDBModel(
    //     key: "Bearer_Token", syncData: jsonEncode(model.toJson()));

    // await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("Bearer_Token");
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
