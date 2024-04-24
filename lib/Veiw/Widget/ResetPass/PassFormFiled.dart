// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/ResetPassController.dart';
import '../../../Controller/Color.dart';
import '../../../Core/Function/ValidInput.dart';

class PassFormField extends StatelessWidget {
  const PassFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestPassController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: TextFormField(
            controller: controller.Pass,
            validator: (value) {
              return validInput(value!, 5, 100, "Password");
            },
            textInputAction: TextInputAction.next,
            cursorColor: const Color.fromARGB(255, 0, 0, 0),
            obscureText: (controller.f) ? false : true,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                child: (controller.f)
                    ? const Icon(
                        Icons.visibility,
                      )
                    : const Icon(
                        Icons.visibility_off,
                      ),
                onTap: () {
                  controller.SeeHied(1);
                },
              ),
              suffixIconColor: Appcolor.primaryColor,
              floatingLabelStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              label: Text("9".tr,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
              hintText: "22".tr,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
            ),
          ),
        );
      },
    );
  }
}
