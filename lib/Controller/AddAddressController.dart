// ignore_for_file: camel_case_types, file_names

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Function/handleData.dart';
import '../Core/Services/services.dart';
import '../Date/Source/Remote/address.dart';
import 'AddressController.dart';
import 'CheckOutController.dart';

class AddAddressController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController addressname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController rigon = TextEditingController();
  TextEditingController details = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  AddressController con = Get.put(AddressController());
  CheckOutController con2 = Get.put(CheckOutController());
  List<SelectedListItem> dataBox = [];
  String check = "";
  List cityCost = [], data2 = [];
  AddressData testData = AddressData(Get.find());
  MyServices myServices = Get.find();
  Map<String, String> cityTOcost = {};
  late StatusRequest statusRequest;
  getCiteInApp() async {
    statusRequest = StatusRequest.loading;
    var res = await testData.cityCost();
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        for (int i = 0; i < res["data"].length; i++) {
          cityTOcost[res["data"][i]["delivery_city"] as String] =
              res["data"][i]["delivery_cost"];
          data2.add("${res["data"][i]["delivery_city"]}");
          dataBox.add(
              SelectedListItem(name: "${res["data"][i]["delivery_city"]}"));
        }
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }

    update();
  }

  addAddress() async {
    var formst = formstate.currentState;
    if (formst!.validate()) {
      statusRequest = StatusRequest.loading;
      var res2 = await testData.addAddress(
          myServices.sharedPreferences.getString("id") as String,
          city.text,
          rigon.text,
          cityTOcost[city.text],
          details.text,
          phone.text,
          name.text,
          addressname.text);
      statusRequest = handleData(res2);
      if (statusRequest == StatusRequest.success) {
        if (res2['status'] == "success") {
          con.getDateInApp();
          con2.getDateInApp();
          Get.back();
        } else {
          statusRequest = StatusRequest.fallure;
        }
      }

      update();
    }
  }

  changeCheck() {
    update();
  }

  @override
  void onInit() {
    getCiteInApp();
    super.onInit();
  }
}
