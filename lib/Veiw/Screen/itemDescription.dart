// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/Color.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:lottie/lottie.dart';
import '../../Controller/CardController.dart';
import '../../Controller/ItemDesController.dart';
import '../../Controller/imgAssets.dart';
import '../../Core/Class/HandelData.dart';
import '../../Core/Class/statusRequest.dart';
import '../../Links.dart';
import '../Widget/ItemDescription/AddCard.dart';
import 'HomeScreen.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDesController());
    Get.put(CardController());

    return GetBuilder<ItemDesController>(
      builder: (controller) {
        return HandelDataRequest(
          widget: (controller.statusRequest == StatusRequest.loading)
              ? Center(
                  child:
                      Lottie.asset(ImgAsset.Loading, height: 180, width: 180),
                )
              : Scaffold(
                  bottomSheet: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 60,
                    color: Colors.white,
                    child: Row(children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 126, 126, 126),
                                  fontSize: 15),
                            ),
                            Text(
                              "\$${(int.parse(controller.item![0]["items_price"]) - (int.parse(controller.item![0]["items_discount"]) / 100) * int.parse(controller.item![0]["items_price"])).toInt()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: AddCard(
                            count: controller.i_need.toString(),
                            itemId: controller.item![0]["items_id"]),
                      )
                    ]),
                  ),
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 18.0,
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Get.offAll(const HomeScreen(), arguments: "card",transition: Transition.downToUp);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: SvgPicture.asset(
                            "${ImgAsset.RootAssets}/bag-svgrepo-com.svg",
                            color: const Color.fromARGB(255, 0, 0, 0),
                            height: 25,
                            width: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                  body: Container(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, bottom: 60),
                    color: Colors.white,
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "${controller.item![0]["items_name"]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Brand: ${controller.item![0]["items_brand"]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (value) {
                            controller.onPageChange(value);
                          },
                          controller: controller.pageController,
                          itemBuilder: (context, index) => SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.network(
                                "${AppLink.ImgItem}/${controller.img[controller.currentPage]}",
                              )),
                          itemCount: 10,
                        ),
                      ),
                      Container(
                        height: 100,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 100,
                              child: ListView.builder(
                                controller: controller.scrollController,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.selcet(index);
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 100),
                                        width: 100,
                                        height: 100,
                                        child: Image.network(
                                            "${AppLink.ImgItem}${controller.img[index]}"),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: controller.img.length,
                              ),
                            ),
                            Center(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: (controller.t2)
                                            ? Appcolor.primaryColor
                                            : Colors.grey[200],
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,
                                          size: 20,
                                          color: (controller.t2)
                                              ? Colors.white
                                              : Colors.grey[500],
                                        )),
                                    onTap: () {
                                      controller.onTapNextBefor2();
                                      controller.befor();
                                    },
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: (controller.t)
                                            ? Appcolor.primaryColor
                                            : Colors.grey[200],
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 20,
                                          color: (controller.t)
                                              ? Colors.white
                                              : Colors.grey[500],
                                        )),
                                    onTap: () {
                                      controller.onTapNextBefor();
                                      controller.next();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.increase();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(255, 0, 8, 99),
                                        borderRadius:
                                            BorderRadius.circular(7.0)),
                                    child: const Icon(
                                      Icons.arrow_drop_up_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 30,
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
                                    "${controller.i_need}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.decrease();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(255, 0, 8, 99),
                                        borderRadius:
                                            BorderRadius.circular(7.0)),
                                    child: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                              "Available: ${controller.item![0]["items_count"]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 53, 53, 53)))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.onTapDetailsReview(0);
                                },
                                child: Column(
                                  children: [
                                    const Text(
                                      "Details",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    if (controller.currentTap == 0)
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                        child: CircleAvatar(
                                          radius: 4.0,
                                          backgroundColor:
                                              Color.fromARGB(255, 0, 8, 99),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.onTapDetailsReview(1);
                                },
                                child: Column(
                                  children: [
                                    const Text(
                                      "Review",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    if (controller.currentTap == 1)
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                        child: CircleAvatar(
                                          radius: 4.0,
                                          backgroundColor:
                                              Color.fromARGB(255, 0, 8, 99),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      controller.listPage.elementAt(controller.currentTap)
                    ]),
                  ),
                ),
          stateRequest: controller.statusRequest,
        );
      },
    );
  }
}
