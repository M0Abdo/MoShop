// ignore_for_file: file_names, avoid_print

import 'dart:async';

import 'package:electronics_shop2/Core/Services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../Core/Class/statusRequest.dart';
import '../Core/Function/handleData.dart';
import '../Date/Source/Remote/home.dart';

class HomeController extends GetxController {
  int currentPage = 0;
  MyServices myServices = Get.find();
  Timer? timer;

  HomeData testData = HomeData(Get.find());
  List categories = [], items = [], sum = [], items2 = [], ads = [];
  late StatusRequest statusRequest = StatusRequest.none;
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await testData
        .postdata(myServices.sharedPreferences.getString("id").toString());
    statusRequest = handleData(res);

    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        categories.addAll(res["categories"]);
        items.addAll(res["items"]);
        items2.addAll(res["items2"]);
        ads.addAll(res["ads"]);
        sum.addAll(res["sum"]);
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

  onPageChange(int i) {
    currentPage = i;
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) => print(value));
    getDateInApp();
   
    super.onInit();
  }
}
