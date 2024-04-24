// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Controller/Color.dart';
import '../../../Controller/ItemDesController.dart';
import '../../../Links.dart';

class Detalis extends StatelessWidget {
  const Detalis({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDesController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Column(
                children: [
                 ConstrainedBox(
                          constraints:
                              const BoxConstraints(maxHeight: double.maxFinite),
                          child: ListView.builder(
                        itemCount: controller.detalis.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                //  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 227, 227, 227),
                                    borderRadius: BorderRadius.circular(10)),
                                height: 80,
                                width: 160,
                                child: Center(
                                  child: ListTile(
                                    isThreeLine: true,
                                    leading: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: SvgPicture.network(
                                        "${AppLink.ImgItem}/${controller.detalis[index]["detalis_img"]}",
                                        color:
                                            const Color.fromARGB(255, 80, 80, 80),
                                        height: 35.0,
                                      ),
                                    ),
                                    title: Text(
                                      "${controller.detalis[index]["detalis_title"]}:",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Appcolor.primaryColor),
                                    ),
                                    subtitle: Text(
                                      "${controller.detalis[index]["detalis_subtitle"]}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    minLeadingWidth: 10.0,
                                    contentPadding: const EdgeInsets.all(5.0),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
               if(controller.detalis.isNotEmpty)   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "More Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                "${controller.item![0]["items_description"]}",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 74, 73, 73)),
                textAlign: TextAlign.start,
              ),
            )
          ],
        );
      },
    );
  }
}
