// ignore_for_file: camel_case_types

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Controller/CardController.dart';
import '../../Controller/Color.dart';
import '../../Controller/imgAssets.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../../Core/Class/HandelData.dart';
import '../Widget/AppBarCustom.dart';
import '../Widget/Card/cardTotal.dart';
import '../Widget/Card/card_item.dart';
import '../Widget/Card/checkOutButton.dart';

class bag extends StatelessWidget {
  const bag({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CardController());
    return GetBuilder<CardController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
              color: Colors.white,
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: AppBarCuston(title: "Card",),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                onChanged: (val) {
                                   controller.searchc();
                                  controller.checkTest(val);
                                 
                                },
                                controller: controller.searchControler,
                                decoration:  InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(52, 210, 210, 210),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              0, 158, 158, 158))),
                                  hintText: "Search in card",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              0, 158, 158, 158))),
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(115, 83, 83, 83),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                                cursorColor: const Color.fromARGB(75, 5, 1, 1),
                                maxLines: 1,
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (controller.f) {
                                    controller.ch();
                                  } else {
                                    controller.searchc();
                                  }
                                },
                                child: (controller.f)
                                    ? Container(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                52, 210, 210, 210),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10.0),
                                                topRight:
                                                    Radius.circular(10.0))),
                                        height: 60.h,
                                        child:  Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Colors.black,
                                          size: 18.0.h,
                                        ))
                                    : Container(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                52, 210, 210, 210),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10.0),
                                                topRight:
                                                    Radius.circular(10.0))),
                                        height: 60.h,
                                        child: Image.asset(
                                          ImgAsset.SearchImg,
                                          color: const Color.fromARGB(
                                              255, 83, 83, 83),
                                          height: 50.0.h,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 13,
                      child: HandelDataRequest(
                        stateRequest: controller.statusRequest,
                        widget: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "${controller.items.length} Proudect",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 142, 142, 142),
                                        fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 38.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          52, 210, 210, 210),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                      child: DropdownButton<String>(
                                        dropdownColor:
                                            const Color.fromARGB(255, 246, 246, 246),
                                        style:  TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 123, 123, 123),
                                            fontSize: 14.sp),
                                        underline: Container(),
                                        hint: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                controller.cha,
                                                style:  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 123, 123, 123),
                                                    fontSize: 14.sp),
                                              ),
                                            if(controller.cha=="Sort By")  const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color: Color.fromARGB(
                                                    255, 123, 123, 123),
                                              ),
                                            ],
                                          ),
                                        ),
                                        iconSize: 0.0,
                                        items: controller.dropDown
                                            .map<DropdownMenuItem<String>>(
                                          (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          controller.changeCh(value!);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: SizedBox(
                                height: 300.h,
                                width: double.infinity,
                                child: (controller.items.isEmpty == true)
                                    ?  Center(
                                        child: Text(
                                          "No Items",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 123, 123, 123),
                                              fontSize: 14.sp),
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: controller.items.length,
                                        itemBuilder: (context, index) {
                                          if (index ==
                                              controller.items.length - 1) {
                                            return Column(
                                              children: [
                                                card_item(index: index),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 1.0,
                                                      vertical: 10.0),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 8.0),
                                                    height: 50.h,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color:
                                                          Colors.grey.shade100,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors
                                                              .grey.shade400,
                                                          offset: const Offset(
                                                              4.0, 4.0),
                                                          blurRadius: 10.0,
                                                          spreadRadius: -3.0,
                                                        )
                                                      ],
                                                    ),
                                                    child: Form(
                                                      key: controller.formstate,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 4,
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          5.0,
                                                                      vertical:
                                                                          8.0),
                                                              child:
                                                                  TextFormField(
                                                               
                                                                controller:
                                                                    controller
                                                                        .couponController,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .done,
                                                                cursorColor:
                                                                    const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                decoration:
                                                                    const InputDecoration(
                                                                  errorBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              0,
                                                                              0))),
                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              215,
                                                                              0,
                                                                              0))),
                                                                  floatingLabelStyle:
                                                                      TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              0,
                                                                              0,
                                                                              0)),
                                                                  contentPadding: EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          15.0,
                                                                      left:
                                                                          15.0),
                                                                  hintText:
                                                                      "Coupon Code",
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .always,
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              8.0)),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Appcolor.primaryColor)),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              8.0)),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.black)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                               
                                                                      controller
                                                                      .checkCoupon();
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  color: const Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          8,
                                                                          99),
                                                                ),
                                                                height: 35.h,
                                                                child:  Center(
                                                                    child: Text(
                                                                  "apply",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16.0.sp),
                                                                )),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const cardTotal(),
                                                const checkOutButton()
                                              ],
                                            );
                                          }
                                          return card_item(index: index);
                                        },
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ));
  }
}
