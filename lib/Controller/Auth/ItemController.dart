// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Core/Services/services.dart';
import '../../Date/Source/Remote/item.dart';

class ItemController extends GetxController {
  List categries = [];
  int? selectCat;

  MyServices myServices = Get.find();
  ItemData testData = ItemData(Get.find());
  List categories = [], items = [];
  late StatusRequest statusRequest = StatusRequest.none;
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await testData.getDateFormBack((selectCat! + 1).toString(),
        myServices.sharedPreferences.getString("id").toString());
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        // categories.addAll(res["categories"]);
        items.addAll(res["data"]);
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

  List<String> dropDown = [
    "Alphabet",
    "By Cheaper",
  ];
  String ch = "Sort By";
  changeCh(String v) {
    ch = v;
    if (v == "Alphabet") {
      sortName();
    } else if (v == "By Cheaper") {
      sortCheaper();
    }
    update();
  }

  sortCheaper() {
    items.sort((m1, m2) {
      var lastNameComparison = m1['items_price'].compareTo(m2['items_price']);
      if (lastNameComparison != 0) {
        return lastNameComparison;
      }
      return m1['items_price'].compareTo(m2['items_price']);
    });
    items.reversed.toList();
    update();
  }

  sortName() {
    items.sort((m1, m2) {
      var lastNameComparison = m1['items_name'].compareTo(m2['items_name']);
      if (lastNameComparison != 0) {
        return lastNameComparison;
      }
      return m1['items_name'].compareTo(m2['items_name']);
    });
    items.reversed.toList();
    update();
  }

  GetInitData() {
    categries = Get.arguments["categries"];
    selectCat = Get.arguments["selectCat"];
  }

  changeSelect(int i) {
    selectCat = i;
    ch = "Sort By";
    items.clear();
    getDateInApp();
    update();
  }

  @override
  void onInit() {
   
    GetInitData();
    getDateInApp();

    super.onInit();
  }
}
