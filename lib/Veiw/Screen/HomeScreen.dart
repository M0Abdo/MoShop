// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/imgAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Controller/HomeScreenController.dart';
import 'package:get/get.dart';

import '../../Core/Function/AlertExitApp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) => Container(
          width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 0.0,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0))),
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.deleteCon();
                      controller.changePage(0);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "${ImgAsset.RootAssets}/home-svgrepo-com.svg",
                          color: (controller.curunetpage == 0)
                              ? const Color.fromARGB(255, 0, 11, 127)
                              : const Color.fromARGB(255, 124, 124, 124),
                          height: 30,
                          width: 30,
                        ),
                        if (controller.curunetpage == 0)
                          const Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: CircleAvatar(
                              radius: 4.0,
                              backgroundColor: Color.fromARGB(255, 0, 8, 99),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                     controller.deleteCon();
                      controller.changePage(1);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: (controller.curunetpage == 1)
                              ? const Color.fromARGB(255, 0, 11, 127)
                              : const Color.fromARGB(255, 124, 124, 124),
                          size: 31,
                        ),
                        if (controller.curunetpage == 1)
                          const Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: CircleAvatar(
                              radius: 4.0,
                              backgroundColor: Color.fromARGB(255, 0, 8, 99),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.deleteCon();
                      controller.changePage(2);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "${ImgAsset.RootAssets}/bag-svgrepo-com.svg",
                          color: (controller.curunetpage == 2)
                              ? const Color.fromARGB(255, 0, 11, 127)
                              : const Color.fromARGB(255, 124, 124, 124),
                          height: 30,
                          width: 30,
                        ),
                        if (controller.curunetpage == 2)
                          const Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: CircleAvatar(
                              radius: 4.0,
                              backgroundColor: Color.fromARGB(255, 0, 8, 99),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                     controller.deleteCon();
                      controller.changePage(3);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "${ImgAsset.RootAssets}/shopping-svgrepo-com.svg",
                          color: (controller.curunetpage == 3)
                              ? const Color.fromARGB(255, 0, 11, 127)
                              : const Color.fromARGB(255, 124, 124, 124),
                          height: 30,
                          width: 30,
                        ),
                        if (controller.curunetpage == 3)
                          const Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Center(
                              child: CircleAvatar(
                                radius: 4.0,
                                backgroundColor: Color.fromARGB(255, 0, 8, 99),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.deleteCon();
                      controller.changePage(4);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "${ImgAsset.RootAssets}/settings-svgrepo-com.svg",
                          color: (controller.curunetpage == 4)
                              ? const Color.fromARGB(255, 0, 11, 127)
                              : const Color.fromARGB(255, 124, 124, 124),
                          height: 30,
                          width: 30,
                        ),
                        if (controller.curunetpage == 4)
                          const Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: CircleAvatar(
                              radius: 4.0,
                              backgroundColor: Color.fromARGB(255, 0, 8, 99),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
          body: WillPopScope( onWillPop: AlertExitApp,child: controller.listPage.elementAt(controller.curunetpage)),
        ),
      ),
    );
  }
}
