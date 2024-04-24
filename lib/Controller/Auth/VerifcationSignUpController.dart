// ignore_for_file: file_names

import 'dart:async';

import 'package:electronics_shop2/Date/Source/Remote/resend.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Date/Source/Remote/VerifcationSignUp.dart';
import '../AppRoute.dart';

class VerifcationSignUpController extends GetxController {
  StatusRequest? statusRequest;
  String? email;
  int c = 0;
  Timer? timer;
  VerifcationSignUpData verifcationSignUpData =
      VerifcationSignUpData(Get.find());
  // TextEditingController codeTextFiled = TextEditingController();

  checkCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await verifcationSignUpData.postdata(verificationCode, email!);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        Get.toNamed(AppRoute.Success);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "This is worng code");
      }
    }
    update();
  }

  resend() async {
    Resend resendcode = Resend(Get.find());
    var res2 = await resendcode.getDateFormBack(email);
    statusRequest = handleData(res2);
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
    email = Get.arguments["email"]; //Wwwwwwwwaring
    startTimer();
    super.onInit();
  }
}
