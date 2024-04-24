// ignore_for_file: camel_case_types

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/CardController.dart';
import '../../../Links.dart';

class card_item extends StatelessWidget {
  final int index;
  const card_item({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(CardController());
    return GetBuilder<CardController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 0.0,right: 0.0),
        child: Container(
          width: double.infinity,
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(4.0, 4.0),
                blurRadius: 10.0,
                spreadRadius: -3.0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: Image.network(
                        "${AppLink.ImgItem}/${controller.items[index]['items_img']}",
                        fit: BoxFit.fitWidth,
                        height: 100.h,
                      ),
                      
                    ),
                     if(controller.items[index]["items_discount"]!="0")
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: const Color.fromARGB(255, 255, 18, 1),
                      child: Center(
                        child: Text(
                          "-${controller.items[index]["items_discount"]}%",
                          style:  TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
             
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${controller.items[index]["items_name"]}",
                        maxLines: 3,
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${controller.items[index]["items_brand"]}",
                        style:  TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0.sp,
                        ),
                      ),
                    ),
                    if(controller.items[index]["items_discount"]!="0")
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.items[index]["items_price"]}\$",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 225, 0, 0),
                                        fontSize: 15.sp,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                 Text(
                                    "${(int.parse(controller.items[index]["items_price"]) - (int.parse(controller.items[index]["items_discount"]) 
                                             / 100) * int.parse(controller.items[index]["items_price"])).toInt()}\$",
                                    style:  TextStyle(
                                      color: Color.fromARGB(255, 0, 8, 99),
                                        fontWeight: FontWeight.bold, fontSize: 16.sp),
                                  ),
                                ],
                              ),
                     )
                    else 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${controller.items[index]["items_price"]}\$",
                        style:  TextStyle(
                          color: Color.fromARGB(255, 0, 8, 99),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0.sp,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              controller.increase(index);
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 0, 8, 99),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child:  Icon(
                                Icons.arrow_drop_up_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 50.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                inset: true,
                                color: Colors.white,
                                //  spreadRadius: 1,
                                blurRadius: 5.0,
                                offset: -const Offset(3, 3),
                              ),
                              const BoxShadow(
                                inset: true,
                                color: Color(0xFFA7A9AF),
                                // spreadRadius: 2,
                                blurRadius: 5.0,
                                offset: Offset(3, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "${controller.counts[index]}",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              controller.decrease(index);
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 0, 8, 99),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child:  Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.delete(index);
                        },
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 200, 14, 14),
                              borderRadius: BorderRadius.circular(7.0)),
                          child:  Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 23.h,
                          ),
                        ),
                      ),
                    ),
                   if(controller.upda[index]) Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.change(index);
                        },
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 4, 25, 251),
                              borderRadius: BorderRadius.circular(7.0)),
                          child:  Icon(
                            Icons.change_circle_outlined,
                            color: Colors.white,
                            size: 23.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
