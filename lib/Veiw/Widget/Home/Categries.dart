// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Controller/AppRoute.dart';
import '../../../Controller/HomeController.dart';
import '../../../Core/Function/translateDatabase.dart';
import '../../../Links.dart';

class Categries extends StatelessWidget {
  const Categries({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric( vertical: 5.0),
          height: 70.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color:
                               const Color.fromARGB(255, 4, 15, 139)
                              ,
                          borderRadius: BorderRadius.circular(15)),
                    
                      width: 210.w,
                      child: ListTile(
                          onTap: () {
                          
                             Get.toNamed(AppRoute.Item,arguments: {"selectCat":index,"categries":controller.categories});
                          },
                          title: Text(
                            "${translateDatabase(controller.categories[index]['categories_arabic'],controller.categories[index]['categories_name'])}",
                            style:  TextStyle(
                                color: 
                                   Colors.white,
                                    
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0.sp),
                          ),
                          subtitle:  Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("${controller.sum[index]} Proudect",
                                style:  TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 13.0.sp)),
                          ),
                          leading: Container(
                            padding: const EdgeInsets.all(4.0),
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                color:  const Color.fromARGB(206, 250, 250, 251),
                                   
                                borderRadius: BorderRadius.circular(15)),
                            child: SvgPicture.network(
                              "${AppLink.ImgCategories}${controller.categories[index]['categories_image']}",
                            ),
                          ),
                        ),
                  ));
            },
          ),
        );
      },
    );
  }
}
