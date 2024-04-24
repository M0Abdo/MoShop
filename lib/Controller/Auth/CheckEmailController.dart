// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:async';

import 'package:get/get.dart';

import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Date/Source/Remote/ForgetPass/veriycodeforget.dart';
import '../../Date/Source/Remote/resend.dart';
import '../AppRoute.dart';

class CheckEmailController extends GetxController {
  String? email;
  StatusRequest? statusRequest;
  VeriyCodeForget checkEmail = VeriyCodeForget(Get.find());
  int c = 0;
  Timer? timer;

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

  GoToResetPass(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await checkEmail.postdata(email!, verificationCode);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        Get.offAllNamed(AppRoute.ResetPass, arguments: {"email": "$email"});
      } else {
        Get.defaultDialog(title: "Warning", middleText: "This is worng code");
      }
    }
    update();
  }

  @override
  void onInit() {
    startTimer();
    email = Get.arguments["email"]; //Wwwwwwwwaring
    super.onInit();
  }
}
