import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/Color.dart';
import '../../Controller/OrderController.dart';
import '../Widget/AppBarCustom.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      
      body: GetBuilder<OrderController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.only(right: 15, top: 25.0,left: 15),
          color: Colors.white,
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: AppBarCuston(
                  title: "Orders",
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                         controller.changeSel(0);
                            controller.getDateInApp();
                          },
                          child: Container(
                              height: 30.h,
                              decoration: (controller.select == 0)
                                  ?  BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Appcolor.primaryColor,
                                              width: 3.0.w)))
                                  : null,
                              child: Center(
                                child: Text(
                                  "Next Orders",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: (controller.select == 0)
                                        ? Appcolor.primaryColor
                                        : const Color.fromARGB(255, 155, 162, 236),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21.sp,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.changeSel(1);
                            controller.getDateInApp();
                          },
                          child: Container(
                              height: 30.h,
                              decoration: (controller.select == 1)
                                  ?  BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Appcolor.primaryColor,
                                              width: 3.0.w)))
                                  : null,
                              child: Center(
                                child: Text(
                                  "Orders History",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: (controller.select == 1)
                                        ? Appcolor.primaryColor
                                        : const Color.fromARGB(255, 155, 162, 236),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21.sp,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 24, child: controller.listOrder.elementAt(controller.select))
            ],
          ),
        ),
      ),
    );
  }
}
