// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/AppRoute.dart';
import 'package:electronics_shop2/Controller/Auth/SignUpController.dart';
import 'package:electronics_shop2/Controller/Color.dart';
import 'package:electronics_shop2/Controller/imgAssets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        width: double.infinity,
        height: double.infinity,
        color:  Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: Center(
                child: Lottie.asset(ImgAsset.SuccessImg,
                    height: 260, width: 280, repeat: false),
              ),
            ),
            Text(
              "38".tr,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 90.0),
              child: Text(
                "39".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(AppRoute.login);
                Get.delete<SignUpController>();
              },
              child: Container(
                height: 50,
                width: 190,
                decoration: BoxDecoration(
                    color: Appcolor.primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  "40".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
