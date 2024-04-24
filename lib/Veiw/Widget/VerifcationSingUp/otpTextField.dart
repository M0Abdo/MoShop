// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../Controller/Auth/VerifcationSignUpController.dart';
import '../../../Controller/Color.dart';
import 'package:get/get.dart';

class otpTextField extends StatelessWidget {
  const otpTextField({super.key});

  @override
  Widget build(BuildContext context) {
    VerifcationSignUpController controller = Get.find();
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
        controller.checkCode(verificationCode);
      },
    );
  }
}
