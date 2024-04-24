// ignore_for_file: camel_case_types, file_names

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:electronics_shop2/Core/Services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Core/Function/handleData.dart';
import '../Date/Source/Remote/getFavoret.dart';

class getFavoretController extends GetxController {
  bool f = false;
  getFavoret testData = getFavoret(Get.find());
  TextEditingController? searchControler = TextEditingController();
  List data = [], temp = [], dataSearch = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    var res = await testData.getDateFormBack(
        myServices.sharedPreferences.getString("id").toString());
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        data.addAll(res["data"]);
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    temp = data;
    update();
  }
  List<String> dropDown = [
    "Alphabet",
    "By Cheaper",
  ];
  String cha = "Sort By";
  changeCh(String v) {
    cha = v;
    if (v == "Alphabet") {
      sortName();
    } else if (v == "By Cheaper") {
      sortCheaper();
    }
    update();
  }

  sortCheaper() {
    data.sort((m1, m2) {
      var lastNameComparison = m1['items_price'].compareTo(m2['items_price']);
      if (lastNameComparison != 0) {
        return lastNameComparison;
      }
      return m1['items_price'].compareTo(m2['items_price']);
    });
    data.reversed.toList();
    update();
  }

  sortName() {
    data.sort((m1, m2) {
      var lastNameComparison = m1['items_name'].compareTo(m2['items_name']);
      if (lastNameComparison != 0) {
        return lastNameComparison;
      }
      return m1['items_name'].compareTo(m2['items_name']);
    });
    data.reversed.toList();
    update();
  }

  searchf() async {
    dataSearch.clear();
    f = true;
    statusRequest = StatusRequest.loading;
    var res2 = await testData.search(
        myServices.sharedPreferences.getString("id").toString(),
        searchControler!.text);
    statusRequest = handleData(res2);
    if (statusRequest == StatusRequest.success) {
      if (res2['status'] == "success") {
        dataSearch.addAll(res2["data"]);
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    data = dataSearch;

    update();
  }

  ch() {
    f = false;
    data = temp;
    searchControler!.text = "";
    update();
  }

  deletItem(id) {
    data.removeWhere((element) => element["items_id"] == id);
    update();
  }

  checkTest(val) {
    if (val == "") {
      data = temp;
    searchControler!.text = "";statusRequest = StatusRequest.none;
    f = false;
      update();
    }
  }

  @override
  void onInit() {
    getDateInApp();
    super.onInit();
  }
}
