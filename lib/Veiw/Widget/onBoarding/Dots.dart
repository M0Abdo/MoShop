// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/Auth/onboardingControl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Color.dart';
import '../../../Date/Source/Static/static.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onboardingContronlImp>(
      builder: 
      (controller) =>  Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      ...List.generate(
                        onboardingList.length,(index) => Padding(
                        padding: const EdgeInsets.only(right:2.0),
                        child: AnimatedContainer(duration: const Duration(milliseconds: 100),width: controller.currentPage==index?20:6,height: 6,decoration: BoxDecoration(color:controller.currentPage==index? Appcolor.primaryColor:Colors.grey,borderRadius: BorderRadius.circular(10)),),
                      )),
                  ],),
    ),);
  }
}