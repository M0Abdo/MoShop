// ignore_for_file: camel_case_types, file_names

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/Function/handleData.dart';
import '../Core/Services/services.dart';
import '../Date/Source/Remote/details.dart';
import 'OrderController.dart';

class AddDerliveryRatingController extends GetxController {
  Map item = {};
  ItemData testData = ItemData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController details = TextEditingController();
  int  indexRating = -1;
  OrderController con = Get.find();
  late StatusRequest statusRequest = StatusRequest.none;
  addRarting() async {
   if(indexRating != -1){ statusRequest = StatusRequest.loading;
    var res = await testData.addDeliveryRating(
      item["order_id"],
      item["order_delivery_man"],
      myServices.sharedPreferences.getString("id").toString(),
      details.text.toString(),
      (indexRating + 1).toString(),
    );

    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        con.getDateInApp();
        Get.back();
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();}
  }

  up(int ind) {
    indexRating = ind;
    update();
  }

  @override
  void onInit() {
    item = Get.arguments["it"];

    super.onInit();
  }
}
