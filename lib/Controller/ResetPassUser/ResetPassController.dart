// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Core/Services/services.dart';
import '../../Date/Source/Remote/ForgetPass/resetpass.dart';
import '../AppRoute.dart';

class ResetPassController extends GetxController {
  bool f = false;
  MyServices myServices = Get.find();
  TextEditingController Pass = TextEditingController();
  TextEditingController coPass = TextEditingController();
  GlobalKey<FormState> formstate1 = GlobalKey<FormState>();

  StatusRequest? statusRequest;
  ResetPass signuoData = ResetPass(Get.find());
  GoToSuccess() async {
    if (formstate1.currentState!.validate() == true) {
      ff();
    } else {}
  }

  ff() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await signuoData.postdata(
        myServices.sharedPreferences.getString("email")!, Pass.text);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        Get.offAllNamed(AppRoute.Home,arguments: "setting");
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Try again with anthor password");
      }
    }
    update();
  }

  SeeHied() {
    if (f == true) {
      f = false;
    } else {
      f = true;
    }

    update();
  }

}
