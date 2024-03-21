import 'dart:convert';
import 'dart:io';


import 'package:flutter/foundation.dart';

import 'package:hive/hive.dart';


import 'package:path_provider/path_provider.dart';
import 'package:warrentyopine/Utils/HiveKeys.dart';

import 'Data_model.dart';

class HiveDb {


  static Future initHive() async {
    if(!Hive.isBoxOpen(HiveKeys.boxName)){
      if(!kIsWeb){
        // Directory? dar = await getExternalStorageDirectory();
        Directory? dar = await getApplicationSupportDirectory();
        Hive.init(dar.path);
      }
      var key = Hive.generateSecureKey();
      await Hive.openBox(HiveKeys.boxName);
    }
  }
  static Box getHiveBox()  {
    if(!Hive.isBoxOpen(HiveKeys.boxName)){

      return Hive.box(HiveKeys.boxName);


    }else{
      return Hive.box(HiveKeys.boxName);

    }

  }


  static setToken(String token)  {
    getHiveBox().put(HiveKeys.token, token);

  }

  static String getToken()  {
    var url=getHiveBox().get(HiveKeys.token);

    return url??"";
  }






  static clearDb(){
    getHiveBox().clear();
  }
  static setUserModel(UserModel model) async {
    String jsonData = userModelToJson(model);
    getHiveBox().put(HiveKeys.user, jsonData);
  }
  static UserModel getUserModel() {
    var jsonData = getHiveBox().get(HiveKeys.user);
    UserModel model = UserModel();
    if (null != jsonData) {
      model = userModelFromJson(jsonData);
    } else {}
    return model;
  }


}
