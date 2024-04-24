// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/CheckEmailController.dart';
import '../../../Controller/Color.dart';

class otpTextFieldCheck extends GetView<CheckEmailController> {
  const otpTextFieldCheck({super.key});

  @override
  Widget build(BuildContext context) {
  CheckEmailController controller= Get.find();
    return OtpTextField(
      numberOfFields: 4,
      borderColor: Colors.black,
      focusedBorderColor: Appcolor.primaryColor,
      showFieldAsBox: false,
      cursorColor: Colors.black,
      textStyle: const TextStyle(fontSize: 20.0),
      borderWidth: 4.0,
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) {
        controller.GoToResetPass(verificationCode);
      },
    );
  }
}
