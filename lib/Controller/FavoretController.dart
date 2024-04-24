// ignore_for_file: file_names, non_constant_identifier_names

import 'package:electronics_shop2/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Class/statusRequest.dart';
import '../Core/Function/handleData.dart';
import '../Date/Source/Remote/addFav.dart';

class FavoretController extends GetxController {
  Map isFavoret = {};
  addFav testData = addFav(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  add_to_fav(String id, String text) async {
    statusRequest = StatusRequest.loading;
    var res = await testData.getDateFormBack(
        myServices.sharedPreferences.getString("id").toString(), id, text);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        if (text == "add") {
          Get.rawSnackbar(
            duration: const Duration(milliseconds: 900),
              messageText: const Text("item added to favorite",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white)),
              titleText: const Text("Notification",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white)));
        } else if (text == "delet") {
          Get.rawSnackbar( duration: const Duration(milliseconds: 900),
              messageText: const Text("item deleted to favorite",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white)),
              titleText: const Text("Notification",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white)));
        }
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }

    update();
  }

  changeFav(id, fav, test) {
    isFavoret[id] = fav;

    add_to_fav(id, test);
    update();
  }
}
