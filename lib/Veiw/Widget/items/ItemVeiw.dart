// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Controller/FavoretController.dart';
import '../../../Controller/getFavoretController.dart';
import '../../../Date/Model/ItemModel.dart';
import '../../../Links.dart';

class ItemVeiw extends StatelessWidget {
  final String check;
  final ItemModel itemModel;
  final bool? fav;
  
  const ItemVeiw({
    super.key,
    required this.itemModel,
    required this.check,
    this.fav,
  });

  @override
  Widget build(BuildContext context) {
    getFavoretController favoretController = Get.put(getFavoretController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(70, 158, 158, 158),
                borderRadius: BorderRadius.circular(20.0)),
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      "${AppLink.ImgItem}${itemModel.itemsImg}",
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 120.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${itemModel.itemsName}",
                            maxLines: 3,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0.sp,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: Text(
                              "${itemModel.itemsBrand}",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.0.sp,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              if (check != "0")
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${itemModel.itemsPrice}\$",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 225, 0, 0),
                                          fontSize: 15.sp,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    Text(
                                      "${(itemModel.itemsPrice! - (itemModel.itemsDiscount! / 100) * itemModel.itemsPrice!).toInt()}\$",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                  ],
                                )
                              else
                                Text(
                                  "${itemModel.itemsPrice}\$",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp),
                                ),
                              const Spacer(),
                              GetBuilder<FavoretController>(
                                builder: (controller) => GestureDetector(
                                  onTap: () {
                                    
                                    if(fav==true)
                                    {favoretController.deletItem(itemModel.itemsId);}
                                    if (controller
                                            .isFavoret[itemModel.itemsId] ==
                                        "1") {
                                      controller.changeFav(
                                          itemModel.itemsId, "0", "delet");
                                    } else {
                                      controller.changeFav(
                                          itemModel.itemsId, "1", "add");
                                    }
                                  },
                                  child: Container(
                                    height: 27.h,
                                    width: 27.w,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            27, 158, 158, 158),
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    child: Center(
                                      child: ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (Rect bounds) {
                                          if (controller.isFavoret[
                                                  itemModel.itemsId] ==
                                              "1") {
                                            return const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromARGB(255, 238, 16, 0),
                                                Color.fromARGB(
                                                    255, 254, 125, 116),
                                                // Color.fromARGB(255, 255, 251, 0),
                                              ],
                                            ).createShader(bounds);
                                          }
                                          return const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.black,
                                              Colors.white,
                                            ],
                                          ).createShader(bounds);
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          // color: Color.fromARGB(255, 0, 0, 0),
                                          weight: 10.0.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (check != "0")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: const Color.fromARGB(255, 255, 18, 1),
                child: Center(
                  child: Text(
                    "-${itemModel.itemsDiscount}%",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
