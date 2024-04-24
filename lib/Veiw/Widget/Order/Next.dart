// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/OrderController.dart';
import 'package:electronics_shop2/Controller/imgAssets.dart';
import 'package:electronics_shop2/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class NextOrder extends StatelessWidget {
  const NextOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) => HandelDataRequest(
          stateRequest: controller.statusRequest,
          widget:(controller.nextdata.isEmpty)
                ? SizedBox(
            height: 570,
            child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_rounded,
                        size: 150,
                        color: Colors.grey.shade400,
                      ),
                      Text(
                        "You do not have Heve Ordiers available\n at this time",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  )
                 ,
          ):ListView.builder(
          
                                 
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () {
                        
                          controller.Go(index, 1);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          height: 125,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Order Number: ${controller.nextdata[index]["order_id"]}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Spacer(),
                                      if (controller.nextdata[index]
                                              ["order_state"] ==
                                          '0')
                                        GestureDetector(
                                          onTap: () {
                                            controller.delete(index);
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(
                                                255, 233, 27, 27),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                (controller.nextdata[index]
                                            ["address_details"] ==
                                        'null')
                                    ? const Text(
                                        "Receive in shop",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : Text(
                                        "${controller.nextdata[index]["address_details"]}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: (controller.nextdata[index]
                                              ["address_details"] ==
                                          'null')
                                      ? Row(
                                          children: const [
                                            Icon(
                                              Icons.rocket_launch_outlined,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                            Text(
                                              " Go To Shop To Receive",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        )
                                      : (controller.nextdata[index]
                                                  ["order_state"] ==
                                              '0')
                                          ? Row(
                                              children: [
                                                SvgPicture.asset(
                                                    ImgAsset.OrderProcess,
                                                    height: 20,
                                                    width: 20,
                                                    color: const Color.fromARGB(
                                                        255, 2, 61, 254),
                                                    fit: BoxFit.fill),
                                                const Text(
                                                  " Order Under Review",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                SvgPicture.asset(
                                                    ImgAsset.OderToHome,
                                                    height: 20,
                                                    width: 20,
                                                    color: const Color.fromARGB(
                                                        255, 5, 180, 16),
                                                    fit: BoxFit.fill),
                                                const Text(
                                                  " Order In Way To Your Home",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(controller.nextdata[index]["order_time"])),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                    Text(
                                      ((controller.nextdata[index]
                                                  ["order_address"]) ==
                                              null)
                                          ? "Total: ${int.parse(controller.nextdata[index]["order_price"]) - ((int.parse(controller.nextdata[index]["order_coupon"]) / 100) * int.parse(controller.nextdata[index]["order_price"])).toInt()}\$"
                                          : "Total: ${int.parse(controller.nextdata[index]["order_price"]) + int.parse(controller.nextdata[index]["order_delivery"]) - ((int.parse(controller.nextdata[index]["order_coupon"]) / 100) * int.parse(controller.nextdata[index]["order_price"])).toInt()}\$",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                    itemCount: controller.nextdata.length,
                  ),
    ));
  }
}
