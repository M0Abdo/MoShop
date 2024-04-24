// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/AppRoute.dart';
import '../../../Controller/HomeController.dart';
import '../../../Core/Function/translateDatabase.dart';
import '../../../Links.dart';

class Banerveiw extends StatelessWidget {
  const Banerveiw({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      child: GetBuilder<HomeController>(
        builder: (controller) => PageView.builder(
          onPageChanged: (value) {
            controller.onPageChange(value);
          },
          itemCount: controller.ads.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container( height: 180.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 17, 26, 120),
                          borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(5),
                  child: Stack(
                    
                    children: [Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                     
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height/6,
                                child: Image.network(
                                  "${AppLink.ImgItem}${controller.ads[index]["ads_image"]}",
                                  height: 145.h,
                                                       
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0), 
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                "${translateDatabase(controller.ads[index]["ads_title_ar"],controller.ads[index]["ads_title"])}",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 13.0.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                width: 220.w,
                                child: Text(
                                  "${translateDatabase(controller.ads[index]["ads_con_ar"],controller.ads[index]["ads_con"])}",
                                  maxLines: 4,
                                  style:  TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.0.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                               
                                Get.toNamed(AppRoute.ItemDis, arguments: {
                                  "item": (controller.ads[index]["ads_item"]),
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  height: 40.w,
                                  width: 115.h,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.blue,
                                        Colors.pink,
                                        Colors.orange
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child:  Center(
                                    child: Text(
                                      '45'.tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    
                  ]),
                ),
                
              ],
            );
          },
        ),
      ),
    );
  }
}
