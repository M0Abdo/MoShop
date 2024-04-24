// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/ForgetController.dart';
import '../../../Core/Function/ValidInput.dart';

class EmailFiled extends StatelessWidget {
  const EmailFiled({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetController controller = Get.find();
    return TextFormField(
      textAlign: TextAlign.center,
      cursorColor: Colors.black,
      validator: (value) {
          return validInput(value!, 5, 100, "Email");
      },
      controller: controller.emailControler,
      style: const TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: "27".tr,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black45, width: 1.0)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
      ),
    );
  }
}
