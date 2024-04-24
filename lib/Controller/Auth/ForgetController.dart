// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Date/Source/Remote/ForgetPass/checkemail.dart';
import '../AppRoute.dart';

class ForgetController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  CheckEmail checkEmail = CheckEmail(Get.find());

  GoToCheckEmail() async {
    var formst = formstate.currentState;
    if (formst!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await checkEmail.postdata(emailControler.text);
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
        
          Get.toNamed(AppRoute.CheckEmail,
              arguments: {"email": emailControler.text});
                emailControler.text = "";
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Email is not found");
        }
      }
      update();
    }
  }
}
