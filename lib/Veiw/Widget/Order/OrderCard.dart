// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:electronics_shop2/Controller/OrderController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Controller/Color.dart';
import '../../Screen/AddDerliveryRating.dart';

class OrderCard extends StatelessWidget {
  final  index;
  const OrderCard({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder:(controller) =>  Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: () => controller.Go(index, 0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15.0)),
            child:
                Row(
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "Order Number: ${controller.historydata[index]["order_id"]}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
              (controller.historydata[index]["address_details"] == 'null')
                      ? const Text(
                          "Receive in shop",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : Text(
                          "${controller.historydata[index]["address_details"]}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
              Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: (controller.historydata[index]["order_state"] == '3')
                        ? Row(
                            children: const [
                              Icon(
                                Icons.cancel_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 229, 32, 32),
                              ),
                              Text(
                                " Order Canced",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              const Icon(
                                Icons.task_alt_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 5, 180, 16),
                              ),
                              Text(
                                (controller.historydata[index]["order_address"] ==
                                        null)
                                    ? " Order Recived"
                                    : " Order Deliverd",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
              ),
              Text(
                    DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(controller.historydata[index]["order_time"])),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
              ),
             
             
            ]),
            const Spacer(),
             Column(
               children: [
               if (controller.historydata[index]["order_state"] == '2'&&controller.historydata[index]["order_address"]!= null&&controller.historydata[index]["order_rating"]=='0') GestureDetector(
                onTap: (){
                                     Get.to(const AddDerliveryRating(), arguments: {'it': controller.historydata[index]});
                },
                 child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(color: Appcolor.primaryColor, borderRadius: BorderRadius.circular(10)),
                                      child: const Center(child: Text("Rating",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                                    ),
               ),
                if (controller.historydata[index]["order_state"] == '2'&&controller.historydata[index]["order_address"]!= null&&controller.historydata[index]["order_rating"]=='1')
                                const Text("You rating this before",),
                                  const Spacer(),
                 Text(
                    ((controller.historydata[index]["order_address"]) == null)
                        ? "Total: ${int.parse(controller.historydata[index]["order_price"]) - ((int.parse(controller.historydata[index]["order_coupon"]) / 100) * int.parse(controller.historydata[index]["order_price"])).toInt()}\$"
                        : "Total: ${int.parse(controller.historydata[index]["order_price"]) + int.parse(controller.historydata[index]["order_delivery"]) - ((int.parse(controller.historydata[index]["order_coupon"]) / 100) * int.parse(controller.historydata[index]["order_price"])).toInt()}\$",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
               ],
             ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
