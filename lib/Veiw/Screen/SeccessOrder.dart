// ignore: file_names
// ignore_for_file: unused_import, file_names, duplicate_ignore

import 'package:electronics_shop2/Controller/HomeController.dart';
import 'package:electronics_shop2/Controller/HomeScreenController.dart';
import 'package:electronics_shop2/Veiw/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/Color.dart';
import '../../Controller/imgAssets.dart';
import '../../Core/Class/Crud.dart';
import '../../Core/Services/services.dart';

class SeccessOrder extends StatelessWidget {
  const SeccessOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 35.0),
      child: Column(
        children: [
          const Spacer(),
          Container(
            color: Colors.white,
            child: Center(
              child: Lottie.asset(
                ImgAsset.SuccessImg,
                height: 200,
                width: 200,
                repeat: false,
              ),
            ),
          ),
           Text(
            "Thank You!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0.sp),
          ),
           Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 90.0),
            child: Text(
              "Your order has been placed!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0.sp, color: Colors.grey),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.offAll(const HomeScreen(), arguments: "order");
            },
            child: Container(
              height: 50.h,
              width: 190.w,
              decoration: BoxDecoration(
                  color: Appcolor.primaryColor,
                  borderRadius: BorderRadius.circular(8)),
              child:  Center(
                  child: Text(
                "Go To Orders",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              )),
            ),
          )
        ],
      ),
    ));
  }
}
