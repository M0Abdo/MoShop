// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/HomeScreenController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/imgAssets.dart';
import '../Screen/Search.dart';

class AppBarCuston extends StatelessWidget {
  final String title;
  const AppBarCuston({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
 
    return Row(
      children: [
        GetBuilder<HomeScreenController>(builder: (controller) =>  GestureDetector(
           onTap: () {
             controller.changePage(4);
             
           },
           child: CircleAvatar(
             radius: 24.0.r,
             backgroundColor: const Color.fromARGB(255, 7, 7, 155),
             child: Center(
               child: Image.asset((controller.myServices.sharedPreferences.getString("gen")=="0")?ImgAsset.BoyImg: ImgAsset.GirlImg, height: 40.h),
             ),
           ),
         ),),
        const Spacer(),
        Text(
          title,
          style:  TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 8, 99)),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.to(const Search(),transition: Transition.upToDown,);
          },
          child: SvgPicture.asset(
            "${ImgAsset.RootAssets}/search.svg",
            color: const Color.fromARGB(255, 80, 80, 80),
            height: 40.0.h,
          ),
        ),
      ],
    );
  }
}
