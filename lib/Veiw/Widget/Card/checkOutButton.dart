// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/CardController.dart';
import '../../Screen/CheckOut.dart';

class checkOutButton extends StatelessWidget {
  const checkOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardController>(
      builder: (controller) => GestureDetector(
        onTap: () {
          Get.off(const CheckOut(), arguments: {
          "dis":  (controller.coupon.isNotEmpty)
                ? int.parse(controller.coupon[0]["coupon_discount"])
                : 0,
                "it":controller.items
    ,"to":controller.totla
          });
        },
        child: Container(
          height: 50.h,
          width: 190.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color.fromARGB(255, 0, 8, 99),
          ),
          child:  Center(
              child: Text(
            "Check Out",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0.sp),
          )),
        ),
      ),
    );
  }
}
