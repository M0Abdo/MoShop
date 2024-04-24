// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/Color.dart';
import '../../../Controller/HomeController.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: 
      (controller) =>  Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      ...List.generate(
                        controller.ads.length,(index) => Padding(
                        padding: const EdgeInsets.only(right:2.0),
                        child: AnimatedContainer(duration: const Duration(milliseconds: 100),width: controller.currentPage==index?20.w:6.w,height: 6.h,decoration: BoxDecoration(color:controller.currentPage==index? Appcolor.primaryColor:Colors.grey,borderRadius: BorderRadius.circular(10)),),
                      )),
                  ],),
    ),);
  }
}