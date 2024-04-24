// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/ItemController.dart';

class Categries extends StatelessWidget {
  final int? selectCat;
  final List categris;
  const Categries({super.key, required this.selectCat, required this.categris});

  @override
  Widget build(BuildContext context) {
    ItemController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        alignment: Alignment.center,
        height: 30.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categris.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(onTap: () {
                  controller.changeSelect(index);
                }, child: GetBuilder<ItemController>(
                  builder: (controller) {
                    return Container(
                        decoration: (index == selectCat)
                            ? const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Appcolor.primaryColor,
                                        width: 3.0)))
                            : null,
                        child: Text(
                          "${categris[index]["categories_name"]}",
                          style:  TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ));
                  },
                )));
          },
        ),
      ),
    );
  }
}
