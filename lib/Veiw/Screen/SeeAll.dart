// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/AppRoute.dart';
import '../../Controller/FavoretController.dart';
import '../../Controller/SeeAllController.dart';
import '../../Controller/imgAssets.dart';
import '../../Date/Model/ItemModel.dart';
import '../../Links.dart';
import '../Widget/items/ItemVeiw.dart';
import 'HomeScreen.dart';

class SeeAll extends StatelessWidget {
  final String title;
  
  const SeeAll({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    Get.put(SeeAllController());
     FavoretController favoretController = Get.put(FavoretController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child:  Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 18.0.h,
            ),
          ),
          title: Text(
            title,
            style:  TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 8, 99)),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.offAll(const HomeScreen(), arguments: "card");
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  "${ImgAsset.RootAssets}/bag-svgrepo-com.svg",
                  color: const Color.fromARGB(255, 0, 0, 0),
                  height: 25.h,
                  width: 25.w,
                ),
              ),
            )
          ],
        ),
        body: GetBuilder<SeeAllController>(
          builder: (controller) => Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.builder(
                                          itemCount: controller.data.length,
                                         
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.aspectRatio*1.5
                  ,
                    crossAxisSpacing: 5.0
                // Adjust the aspect ratio as needed
              ),
                                          itemBuilder: (context, index) {
                                            favoretController.isFavoret[controller
                                                    .data[index]['items_id']] =
                                                controller.data[index]['favoret'];

                                            return GestureDetector(
                                              onTap: () {
                                                Get.toNamed(AppRoute.ItemDis,
                                                    arguments: {
                                                      "item":
                                                          (controller.data[index]
                                                              ["items_id"]),
                                                    });
                                              },
                                              child: ItemVeiw(
                                                itemModel: ItemModel.fromJson(
                                                    controller.data[index]),
                                                check: controller.data[index]
                                                    ['items_discount'],
                                              ),
                                            );
                                          }),
          ),
        ));
  }
}
