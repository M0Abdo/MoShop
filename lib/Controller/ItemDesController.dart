// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Class/statusRequest.dart';
import '../Core/Function/handleData.dart';
import '../Core/Services/services.dart';
import '../Date/Source/Remote/details.dart';
import '../Veiw/Screen/AddRating.dart';
import '../Veiw/Widget/ItemDesciption/Details.dart';
import '../Veiw/Widget/ItemDesciption/Review.dart';
import 'Color.dart';

class ItemDesController extends GetxController {
  int currentPage = 0, currentTap = 0;

  int i_need = 1;
  String? id;
  double allRating = 0.0;

  bool t = false, t2 = false, isRating = false;
  List? item;
  List detalis = [], img = [], ratings = [];
  Map myRating = {};
  late PageController pageController;
  late ScrollController scrollController;
  ItemData testData = ItemData(Get.find());
  late StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await testData.getDateFormBack(
        id!, myServices.sharedPreferences.getString("id"));
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        // categories.addAll(res["categories"]);
        item = res["item"];
        detalis = res["data"];
        if (!(res["isRating"].isEmpty)) isRating = true;
        if (res["allratingnum"]["allRating"] != null) {
          allRating = double.parse(res["allratingnum"]["allRating"]);
        }
        if (!(res["allrating"].isEmpty)) {
          ratings = res["allrating"];
          allRating /= ratings.length;
        }

        if ((res["myrating"] != false)) {
          myRating = res["myrating"];
        }

        img.add(item![0]["items_img"]);

        int l = res!["image"].length;

        for (var i = 0; i < l; i++) {
          img.add(res!["image"][i]["img_name"]);
        }
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

  restartCount() {
    i_need = 1;
    update();
  }

  decrease() {
    if (i_need > 1) {
      i_need--;
      update();
    }
  }

  selcet(int index) {
     pageController.animateToPage(index,
        duration: const Duration(milliseconds: 900), curve: Curves.ease);
    currentPage = index;
    update();
  }

  increase() {
    if (i_need.toString() != item![0]["items_count"]) {
      i_need++;
      update();
    }
  }

  onPageChange(int i) {
    currentPage = i;
    update();
  }

  next() {
    currentPage++;
    if (currentPage >= img.length) {
      currentPage = img.length - 1;
    
}
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.ease);
    scrollController.animateTo(
      scrollController.offset + 100,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
    );
  }

  onTapNextBefor() {
    if (!t) {
      if (t2) t2 = !t2;
      t = !t; //tr
    }
    update();
  }

  onTapNextBefor2() {
    if (!t2) {
      if (t) t = !t;
      t2 = !t2;
    }
    update();
  }

  befor() {
    currentPage--;
    if (currentPage < 0) {
      currentPage = 0;
    }
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.ease);
    scrollController.animateTo(
      scrollController.offset - 100,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
    );
  }

  onTapDetailsReview(int v) {
    currentTap = v;
    update();
  }

  checkAddRating() {
    if (isRating) {
      Get.to(const AddRating(), arguments: {'it': item, "ra": myRating});
    } else {
      Get.defaultDialog(
          title: "Sorry",
          titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Appcolor.primaryColor),
          middleText: "You must buy ${item![0]["items_name"]} first to rite it",
          middleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ]);
    }
  }

  List<Widget> listPage = [const Detalis(), const Review()];

  @override
  onInit() {
    id = Get.arguments["item"];

    getDateInApp();
    pageController = PageController();
    scrollController = ScrollController();

    super.onInit();
  }
}
