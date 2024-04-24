// ignore_for_file: camel_case_types

import 'package:electronics_shop2/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/AppRoute.dart';
import '../../Controller/FavoretController.dart';
import '../../Controller/getFavoretController.dart';
import '../../Date/Model/ItemModel.dart';
import '../../Links.dart';
import '../Widget/AppBarCustom.dart';
import '../Widget/favorite/SearchField.dart';
import '../Widget/items/ItemVeiw.dart';

class favorite extends StatelessWidget {
  const favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(getFavoretController());
   
      FavoretController favoretController = Get.put(FavoretController());
    return GetBuilder<getFavoretController>(
      builder: (controller) =>  Container(
        
            padding: const EdgeInsets.only(
              right: 15,
left: 15,
top: 5
            ),
            color: Colors.white,
            child: Column(children: [
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: AppBarCuston(title: "Favoret",)
                ),
              ),
              const Expanded(flex: 2, child: SearchField()),
              Expanded(
              flex: 12,
                child: HandelData(
          stateRequest: controller.statusRequest,
          widget:Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "${controller.data.length} Proudect",
                            style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 142, 142, 142),
                                fontSize: 15.sp),
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
                     (controller.data.isEmpty)
                                  ?    Expanded(
                      flex: 10, 
                                    child: SizedBox(
                                        height: 300,
                                        child: Center(
                                          child: Text(
                                            "No Items",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    Color.fromARGB(255, 123, 123, 123),
                                                fontSize: 14.sp),
                                          ),
                                        )),
                                  )
                                  :
                    Expanded(
                      flex: 12, 
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
                                                '1';

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
                                                fav: true,
                                                itemModel: ItemModel.fromJson(
                                                    controller.data[index]),
                                                check: controller.data[index]
                                                    ['items_discount'],
                                              ),
                                            );
                                          }),
                    ),
                  ],
                )),
              )
            ]),
          ))
    ;
  }
}
