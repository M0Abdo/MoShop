// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AppRoute.dart';

class MyMiddelWare extends GetMiddleware {
  int? get priorty => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
     if (myServices.sharedPreferences.getString("check") == "2") {
      return const RouteSettings(name: AppRoute.Home);
    }if (myServices.sharedPreferences.getString("check") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
return null;
  }
}
