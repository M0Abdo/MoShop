// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart'hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/CardController.dart';
class cardTotal extends StatelessWidget {
  const cardTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1.0, vertical: 10.0),
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
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
                            children: [
                               Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Text(
                                  "Total ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 125, 124, 124),
                                      fontSize: 18.sp),
                                ),
                              ),
                             GetBuilder<CardController>(builder: (controller) =>  Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child:(controller.coupon.isEmpty)? Text(
                                  "${controller.totla}\$",
                                  style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 8, 99),
                                      fontSize: 18.0.sp),
                                ):Row(children: [
                                  Text(
                                  "${controller.totla}\$",
                                   style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 225, 0, 0),
                                      fontSize: 18.sp,
                                      decoration: TextDecoration.lineThrough),
                                ),Text(
                                  "  ${controller.totla-((int.parse(controller.coupon[0]["coupon_discount"])/100)*controller.totla).ceil()}\$",
                                  style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 8, 99),
                                      fontSize: 18.0.sp),
                                )

                                ],)
                              ),)
                              
                            ],
                          ),
                        ),
                      );
  }
}