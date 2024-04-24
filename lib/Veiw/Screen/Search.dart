// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AppRoute.dart';
import '../../Controller/FavoretController.dart';
import '../../Controller/SearchController.dart';
import '../../Controller/imgAssets.dart';
import '../../Core/Class/HandelData.dart';
import '../../Date/Model/ItemModel.dart';
import '../../Links.dart';
import '../Widget/items/ItemVeiw.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    FavoretController favoretController = Get.put(FavoretController());
    return Scaffold(
      body: GetBuilder<SearchController>(
        builder: (controller) => Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: 58,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(52, 210, 210, 210),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0))),
                            height: 60,
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.black,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 11,
                        child: SizedBox(
                          width: 200,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  controller: controller.searchControler,
                                  onChanged: (val) {
                                    if (val != "") {
                                      controller.getDateInApp();
                                    } else {
                                      controller.checkTest();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(52, 210, 210, 210),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                0, 158, 158, 158))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                0, 158, 158, 158))),
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(115, 83, 83, 83),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  cursorColor:
                                      const Color.fromARGB(75, 5, 1, 1),
                                  maxLines: 1,
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    if (controller.searchControler?.text != "")
                                      controller.getDateInApp();
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(52, 210, 210, 210),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0))),
                                    height: 60,
                                    child: Image.asset(
                                      ImgAsset.SearchImg,
                                      color:
                                          const Color.fromARGB(255, 83, 83, 83),
                                      height: 50.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              HandelDataRequest(
                stateRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    if (controller.data.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 15.0, left: 15.0, top: 18.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Text(
                              (controller.statusRequest == StatusRequest.none)
                                  ? "0 Proudect"
                                  : "${controller.data.length} Proudect",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 142, 142, 142),
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            Container(
                              height: 38,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(52, 210, 210, 210),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  dropdownColor:
                                      const Color.fromARGB(255, 246, 246, 246),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 123, 123, 123),
                                      fontSize: 14),
                                  underline: Container(),
                                  hint: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.ch,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 123, 123, 123),
                                              fontSize: 14),
                                        ),
                                        if (controller.ch == "Sort By")
                                          const Icon(
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
                    (controller.statusRequest == StatusRequest.none ||
                            controller.data.isEmpty)
                        ? Container(
                            height: 600,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: const Center(
                              child: Text(
                                "No Items",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 123, 123, 123),
                                    fontSize: 14),
                              ),
                            ))
                        : Container(
                            height: 700,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: GridView.builder(
                                itemCount: controller.data.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.6,
                                        crossAxisSpacing: 5.0
                                        // Adjust the aspect ratio as needed
                                        ),
                                itemBuilder: (context, index) {
                                  

                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoute.ItemDis, arguments: {
                                        "item": (controller.data[index]
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
