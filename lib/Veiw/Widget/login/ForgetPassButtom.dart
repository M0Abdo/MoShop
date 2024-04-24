// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/AppRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassButtom extends StatelessWidget {
  const ForgetPassButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.ForgetPassR);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 50.0,left: 50.0),
            child: Text("16".tr,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.end),
          ),
        ),
      ],
    );
  }
}
