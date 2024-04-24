import 'package:electronics_shop2/Controller/HomeScreenController.dart';
import 'package:electronics_shop2/Veiw/Screen/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Controller/AppRoute.dart';
import '../../Controller/Auth/ItemController.dart';
import '../../Controller/FavoretController.dart';
import '../../Controller/imgAssets.dart';
import '../../Core/Class/HandelData.dart';
import '../../Date/Model/ItemModel.dart';
import '../Widget/items/Categries.dart';
import '../Widget/items/ItemVeiw.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemController());
    HomeScreenController con = Get.find();
    FavoretController favoretController = Get.put(FavoretController());
    
    return GetBuilder<ItemController>(
      builder: (controller) {
        return Scaffold(
            body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              actions: [
                GestureDetector(
                  onTap: () {
                    con.curunetpage = 2;

                    Get.offNamed(AppRoute.Home);
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
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child:  Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                  size: 18.0.h,
                ),
              ),
              title:  Text(
                "Product",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0.sp),
              ),
            )
          ],
          body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15,),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: SizedBox(height:  45.h,
                              child: TextFormField(
                                enabled: false,
                                decoration:  InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(52, 210, 210, 210),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              0, 158, 158, 158))),
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(115, 83, 83, 83),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp),
                                ),
                                cursorColor: const Color.fromARGB(75, 5, 1, 1),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(52, 210, 210, 210),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0))),
                              height: 45.h,
                              child: Image.asset(
                                ImgAsset.SearchImg,
                                color: const Color.fromARGB(255, 83, 83, 83),
                                height: 50.0.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Get.to(const Search());
                    },
                  ),
                ),
                Categries(
                    categris: controller.categries,
                    selectCat: controller.selectCat),
                Expanded(
                  flex: 9,
                  child: HandelDataRequest(
                      stateRequest: controller.statusRequest,
                      widget: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "${controller.items.length} Proudect",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 142, 142, 142),
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
                                        hint: Row(
                                          children: [
                                            Text(
                                              controller.ch,
                                              style:  TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 123, 123, 123),
                                                  fontSize: 14.sp),
                                            ),
                                          if(controller.ch=="Sort By")  const Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color: Color.fromARGB(
                                                  255, 123, 123, 123),
                                            ),
                                          ],
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
                          ),
                          (controller.items.isEmpty)
                              ?  Expanded(
                                  flex: 9,
                                  child: SizedBox(
                                      height: 300,
                                      child: Center(
                                        child: Text(
                                          "No Items",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 123, 123, 123),
                                              fontSize: 14.sp),
                                        ),
                                      )),
                                )
                              : Expanded(
                                  flex: 9,
                                  child: GridView.builder(
                                      itemCount: controller.items.length,
                                     
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.aspectRatio*1.5
              ,
                crossAxisSpacing: 5.0
            // Adjust the aspect ratio as needed
          ),
                                      itemBuilder: (context, index) {
                                        favoretController.isFavoret[controller
                                                .items[index]['items_id']] =
                                            controller.items[index]['favoret'];

                                        return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(AppRoute.ItemDis,
                                                arguments: {
                                                  "item":
                                                      (controller.items[index]
                                                          ["items_id"]),
                                                });
                                          },
                                          child: ItemVeiw(
                                            itemModel: ItemModel.fromJson(
                                                controller.items[index]),
                                            check: controller.items[index]
                                                ['items_discount'],
                                          ),
                                        );
                                      }),
                                ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
