// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Class/statusRequest.dart';
import '../Core/Function/handleData.dart';
import '../Date/Source/Remote/cad.dart';

class CardController extends GetxController {
  bool f = false;
  List<bool> upda = [];
  CardData testData = CardData(Get.find());
  List items = [], temp = [], dataSearch = [], coupon = [];
  List<int> counts = [], price = [];
  int totla = 0;
  TextEditingController? searchControler = TextEditingController(),
      couponController = TextEditingController();
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late StatusRequest statusRequest,
      statusRequest2,
      statusRequest3 = StatusRequest.none,
      statusRequest4,
      statusRequest5;
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

  insertDateInApp() async {
    statusRequest = StatusRequest.loading;
    String id = myServices.sharedPreferences.getString("id") as String;

    var res = await testData.selectDate(id);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        items.addAll(res!["data"]);

        temp = items;
        for (var i = 0; i < items.length; i++) {
          upda.add(false);
          price.add((int.parse(items[i]["items_price"]) -
                  (int.parse(items[i]["items_discount"]) / 100) *
                      int.parse(items[i]["items_price"]))
              .toInt());
          counts.add(int.parse(items[i]["count"]));
        }
        getTotal();
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

  getTotal() {
    totla = 0;
    for (var i = 0; i < price.length; i++) {
      totla += (price[i] * counts[i]);
    }
    update();
  }

  decrease(int index) {
    if (counts[index] > 1) {
      upda[index] = true;
      counts[index]--;
      update();
    }
  }

  increase(int index) {
    if (counts[index].toString() != items[index]["items_count"]) {
      upda[index] = true;
      counts[index]++;
      update();
    }
  }

  change(int index) async {
  
      statusRequest2 = StatusRequest.loading;

      var res = await testData.updateDate(
          items[index]["card_id"], counts[index].toString());
      statusRequest2 = handleData(res);
      if (statusRequest2 == StatusRequest.success) {
        if (res['status'] == "success") {
          getTotal();
          upda[index] = false;
          Get.rawSnackbar(
            duration: const Duration(milliseconds: 700),
              messageText: const Text("update successful",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white)),
              titleText: const Text("Notification",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white)));
        } else {
          statusRequest = StatusRequest.fallure;
          Get.rawSnackbar(
             duration: const Duration(milliseconds: 700),
              messageText: const Text("try agian",
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
      }
      getTotal();
      update();
    
  }

  delete(int index) async {
    if (statusRequest3 != StatusRequest.loading) {
      statusRequest3 = StatusRequest.loading;

      var res = await testData.deketeDate(items[index]["card_id"]);

      statusRequest3 = handleData(res);
      if (statusRequest3 == StatusRequest.success) {
        if (res['status'] == "success") {
          price.removeAt(index);
          counts.removeAt(index);
          upda.removeAt(index);
          totla = 0;
          for (var i = 0; i < price.length; i++) {
            totla += (price[i] * counts[i]);
          }

          items.removeWhere(
              (element) => element["card_id"] == items[index]["card_id"]);
          update();
        } else {
          statusRequest = StatusRequest.fallure;
          Get.rawSnackbar(
              messageText: const Text("try agian",
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
      }
    }
  }

  searchc() async {
    dataSearch.clear();
    f = true;
    statusRequest = StatusRequest.loading;
    var res4 = await testData.search(
        myServices.sharedPreferences.getString("id").toString(),
        searchControler!.text);
    statusRequest = handleData(res4);
    if (statusRequest == StatusRequest.success) {
      if (res4['status'] == "success") {
        dataSearch.addAll(res4["data"]);
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    items = dataSearch;

    update();
  }

  checkCoupon() async {
    if (couponController!.text != "") {
      statusRequest4 = StatusRequest.loading;
      var res5 = await testData.testcoupon(couponController!.text);
      statusRequest5 = handleData(res5);
      if (statusRequest5 == StatusRequest.success) {
        if (res5['status'] == "success") {
          coupon.addAll(res5["data"]);
          Get.defaultDialog(
              title: "Coupon Discount",
              titleStyle:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              middleText: "Discount Implemented ",
              middleTextStyle: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 187, 6)),
              actions: [
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "canel",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                )
              ]);
        } else {
          statusRequest2 = StatusRequest.fallure;
          Get.defaultDialog(
              title: "Coupon Discount",
              titleStyle:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              middleText: "Invalid Code",
              middleTextStyle: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
              actions: [
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "canel",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                )
              ]);
        }
      }
    }

    update();
  }

  ch() {
    f = false;
    items = temp;
    searchControler!.text = "";
    update();
  }

  checkTest(val) {
    if (val == "") {
      f = false;
      items = temp;
      searchControler!.text = "";
      statusRequest = StatusRequest.none;

      update();
    }
  }

  getDateInApp(String itemId, String count) async {
    statusRequest = StatusRequest.loading;
    String id = myServices.sharedPreferences.getString("id") as String;

    var res = await testData.addDate(id, itemId, count);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        Get.rawSnackbar(
            messageText: const Text("item added to card",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white)),
            titleText: const Text("Notification",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white)));
      } else {
        statusRequest = StatusRequest.fallure;
        Get.rawSnackbar(
            messageText: const Text("try agian",
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
    }
    update();
  }

  @override
  void onInit() {
    insertDateInApp();

    super.onInit();
  }
}
