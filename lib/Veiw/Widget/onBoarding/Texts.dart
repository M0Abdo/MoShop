// ignore_for_file: file_names, avoid_print

import 'package:electronics_shop2/Controller/Auth/onboardingControl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Date/Source/Static/static.dart';

class Texts extends GetView<onboardingContronlImp> {
  const Texts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 131,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChange(val);
          print(val);
        },
        itemCount: onboardingList.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Text(
                "${onboardingList[i].title}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
              ),
            ],
          );
        },
      ),
    );
  }
}
