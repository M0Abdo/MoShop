// ignore_for_file: camel_case_types, file_names, prefer_is_not_empty

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/Function/handleData.dart';
import '../Core/Services/services.dart';
import '../Date/Source/Remote/details.dart';
import 'ItemDesController.dart';

class AddRatingController extends GetxController {
  List item = [];Map myRatin = {};
  ItemData testData = ItemData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController details = TextEditingController();
  int num = 0, indexRating = -1;
  ItemDesController con = Get.find();
  late StatusRequest statusRequest = StatusRequest.none;
  addRarting() async {
   if(indexRating != -1){ statusRequest = StatusRequest.loading;
    var res = await testData.addRating(
        item[0]["items_id"],
        myServices.sharedPreferences.getString("id"),
        details.text.toString(),
        (indexRating + 1).toString());

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

  deleteRating() async {
    statusRequest = StatusRequest.loading;
    var res = await testData.deleteRating(
      myRatin["rating_id"],
    );

    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        indexRating = 0;
        details.text = "";
         con.getDateInApp();
        Get.back();
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

  up(int ind) {
    indexRating = ind;
    update();
  }

  @override
  void onInit() {
    item = Get.arguments["it"];
    myRatin = Get.arguments["ra"];

    if (!(myRatin.isEmpty)) {
      details.text = myRatin["rating_text"];
      indexRating = int.parse(myRatin["rating_num"]) - 1;
    }
    super.onInit();
  }
}
