// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/Auth/onboardingControl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Color.dart';
import '../../../Date/Source/Static/static.dart';

class ButtomStart extends StatelessWidget {
  const ButtomStart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onboardingContronlImp>(
      builder: (controller) {
        return GestureDetector(
            onTap: () {
              controller.next();
            },
            child: Container(
              height: 50,
              width: 190,
              decoration: BoxDecoration(
                  color: Appcolor.primaryColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: (controller.currentPage != onboardingList.length - 1)
                      ?  Text(
                          "5".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,),
                        )
                      :  Text(
                          "6".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                        )),
            ));
      },
    );
  }
}
