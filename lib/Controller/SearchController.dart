// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Core/Class/statusRequest.dart';
import '../Core/Function/handleData.dart';
import '../Date/Source/Remote/search.dart';

class SearchController extends GetxController {
  SearchData testData = SearchData(Get.find());
  TextEditingController? searchControler = TextEditingController();
  List data = [];
  late StatusRequest statusRequest = StatusRequest.none;
  getDateInApp() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var res = await testData.getDateFormBack(searchControler!.text);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        data.addAll(res["data"]);
        print(data);
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

  checkTest() {
    statusRequest = StatusRequest.none;
    data.clear();
    update();
  }
}
