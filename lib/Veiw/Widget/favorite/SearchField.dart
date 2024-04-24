// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/getFavoretController.dart';
import '../../../Controller/imgAssets.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<getFavoretController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    onChanged: (val) {
                      controller.searchf();
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
                              color: Color.fromARGB(0, 158, 158, 158))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(0, 158, 158, 158))),
                      hintText: "Search",
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
                        controller.searchf();
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(52, 210, 210, 210),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.0),
                              topRight: Radius.circular(10.0))),
                     
                      child: (controller.f)
                          ? const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.black,
                              size: 18.0,
                            )
                          : Image.asset(
                              ImgAsset.SearchImg,
                              color: const Color.fromARGB(255, 83, 83, 83),
                              height: 50.0.h,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
