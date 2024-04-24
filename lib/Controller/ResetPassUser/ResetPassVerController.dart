// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'dart:async';

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Function/handleData.dart';
import '../../Core/Services/services.dart';
import '../../Date/Source/Remote/LogIn.dart';
import '../../Date/Source/Remote/VerifcationSignUp.dart';
import '../../Date/Source/Remote/resend.dart';
import '../../Veiw/Screen/ResetPassUser/ResetPass.dart';

class ResetPassControllerVar extends GetxController {
  StatusRequest? statusRequest = StatusRequest.none;
  int c = 0;
  bool f = false;
  Timer? timer;
  VerifcationSignUpData verifcationSignUpData =
      VerifcationSignUpData(Get.find());
  TextEditingController Pass = TextEditingController();
  // TextEditingController codeTextFiled = TextEditingController();
  MyServices myServices = Get.find();
  LogInData signuoData = LogInData(Get.find());
  getDateInApp() async {
    statusRequest = StatusRequest.loading;

    var res = await signuoData.postdata(
        myServices.sharedPreferences.getString("email")!, Pass.text);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        Pass.text = "";
        Get.to(const ResetPass());
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: "Password is Wrong",
            cancel: GestureDetector(
              onTap: () => Get.back(),
              child: const Text("cancel"),
            ));
              Pass.text = "";
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

  checkCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();

    var res = await verifcationSignUpData.postdatauser(
        verificationCode, myServices.sharedPreferences.getString("email")!);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        Get.to(const ResetPass());
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: "This is worng code",
            cancel: GestureDetector(
              onTap: () => Get.back(),
              child: const Text("cancel"),
            ));
      }
    }
    update();
  }

  resend() async {
    statusRequest = StatusRequest.loading;

    Resend resendcode = Resend(Get.find());
    var res2 = await resendcode
        .getDateFormBack(myServices.sharedPreferences.getString("email")!);
    statusRequest = handleData(res2);
    update();
  }

  startTimer() {
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (c <= 29) {
        c++;
      } else {
        timer?.cancel();
      }
      update();
    });
  }

  @override
  void onInit() {
    resend();
    startTimer();

    super.onInit();
  }
}
