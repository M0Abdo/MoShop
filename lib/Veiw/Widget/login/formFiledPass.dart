// ignore_for_file: file_names, camel_case_types

import 'package:electronics_shop2/Controller/Auth/LogInController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Color.dart';
import '../../../Core/Function/ValidInput.dart';

class formFiledPass extends StatelessWidget {
  const formFiledPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 25.0),
        child: TextFormField(
          validator: (value) {
            return validInput(value!, 5, 100, "Password");
          },
          controller: controller.passControler,
          cursorColor: const Color.fromARGB(255, 0, 0, 0),
          obscureText: (controller.f == true) ? false : true,
          obscuringCharacter: "•",
          decoration: InputDecoration(
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0))),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 215, 0, 0))),
            suffixIcon: GestureDetector(
              child: (controller.f == true)
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onTap: () {
                controller.SeeHied();
              },
            ),
            suffixIconColor: Appcolor.primaryColor,
            floatingLabelStyle:
                const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            label: Text(
              "9".tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: "15".tr,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          ),
        ),
      ),
    );
  }
}
