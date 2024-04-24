// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Services/services.dart';
import 'package:get/get.dart';

 translateDatabase(ar, en) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return ar;
  } else {
    return en;
  }
}


