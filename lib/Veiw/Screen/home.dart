// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Controller/AppRoute.dart';
import '../../Controller/FavoretController.dart';
import '../../Controller/HomeController.dart';
import '../../Core/Class/HandelData.dart';
import '../../Date/Model/ItemModel.dart';
import '../Widget/AppBarCustom.dart';
import '../Widget/Home/Banerveiw.dart';
import '../Widget/Home/Categries.dart';
import '../Widget/Home/CustomItemName.dart';
import '../Widget/Home/Dots.dart';
import '../Widget/items/ItemVeiw.dart';
import 'SeeAll.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    FavoretController favoretController = Get.put(FavoretController());
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) {
        return HandelDataRequest(
          widget: Container(
          
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            color: Colors.white,
            child: ListView(children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: AppBarCuston(
                  title: "MoShop",
                ),
              ),
              const Banerveiw(),
              const Dots(),
              const Categries(),
              CustomItemName(
                onTap: () {
                  Get.to(const SeeAll(title: 'Top Selling'),
                      arguments: controller.items,transition: Transition.downToUp);
                },
                name: 'Top Selling',
              ),
              SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: min(10, controller.items.length),
                  itemBuilder: (context, index) {
                    favoretController
                            .isFavoret[controller.items[index]['items_id']] =
                        controller.items[index]['favoret'];
          
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                        
                          Get.toNamed(AppRoute.ItemDis, arguments: {
                            "item": (controller.items[index]["items_id"]),
                          });
                        },
                        child: ItemVeiw(
                          itemModel:
                              ItemModel.fromJson(controller.items[index]),
                          check: controller.items[index]['items_discount'],
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomItemName(
                onTap: () {
                  Get.to(
                      const SeeAll(
                        title: 'Discount',
                      ),
                      arguments: controller.items2,transition: Transition.downToUp);
                },
                name: 'Discount',
              ),
              SizedBox(
                height: 270.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: min(10, controller.items2.length),
                  itemBuilder: (context, index) {
                    favoretController
                            .isFavoret[controller.items2[index]['items_id']] =
                        controller.items2[index]['favoret'];
          
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.ItemDis, arguments: {
                            "item": (controller.items2[index]["items_id"]),
                          });
                        },
                        child: ItemVeiw(
                          itemModel:
                              ItemModel.fromJson(controller.items2[index]),
                          check: controller.items2[index]['items_discount'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
          stateRequest: controller.statusRequest,
        );
      },
    );
  }
}
