// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Controller/Color.dart';
import '../../../Controller/ItemDesController.dart';
import '../../../Controller/imgAssets.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDesController>(
      builder: (controller) => Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    controller.allRating.toStringAsFixed(1),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Color.fromARGB(255, 31, 31, 31)),
                  ),
                  Row(
                    children: [
                      (controller.allRating >= 1.0)
                          ? const Icon(Icons.star,
                              color: Color.fromARGB(255, 255, 166, 0))
                          : (controller.allRating == 0.0)
                              ? const Icon(Icons.star_border)
                              : const Icon(
                                  Icons.star_half,
                                  color: Color.fromARGB(255, 255, 166, 0),
                                ),
                      (controller.allRating >= 2.0)
                          ? const Icon(Icons.star,
                              color: Color.fromARGB(255, 255, 166, 0))
                          : (controller.allRating > 1.0 &&
                                  controller.allRating < 2.0)
                              ? const Icon(
                                  Icons.star_half,
                                  color: Color.fromARGB(255, 255, 166, 0),
                                )
                              : const Icon(Icons.star_border),
                      (controller.allRating >= 3.0)
                          ? const Icon(Icons.star,
                              color: Color.fromARGB(255, 255, 166, 0))
                          : (controller.allRating > 2.0 &&
                                  controller.allRating < 3.0)
                              ? const Icon(
                                  Icons.star_half,
                                  color: Color.fromARGB(255, 255, 166, 0),
                                )
                              : const Icon(Icons.star_border),
                      (controller.allRating >= 4.0)
                          ? const Icon(Icons.star,
                              color: Color.fromARGB(255, 255, 166, 0))
                          : (controller.allRating > 3.0 &&
                                  controller.allRating < 4.0)
                              ? const Icon(
                                  Icons.star_half,
                                  color: Color.fromARGB(255, 255, 166, 0),
                                )
                              : const Icon(Icons.star_border),
                      (controller.allRating == 5.0)
                          ? //3.3
                          const Icon(Icons.star,
                              color: Color.fromARGB(255, 255, 166, 0))
                          : (controller.allRating > 4.0 &&
                                  controller.allRating < 5.0)
                              ? const Icon(
                                  Icons.star_half,
                                  color: Color.fromARGB(255, 255, 166, 0),
                                )
                              : const Icon(Icons.star_border),
                    ],
                  ),
                  Text(
                    "${controller.ratings.length}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  controller.checkAddRating();
                },
                child: Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Appcolor.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child:  Center(
                    child: Text(
                    (controller.myRating.isNotEmpty)?"My Review":  "Add Review",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              )
            ],
          ),
          ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: double.infinity),
              child: ListView.builder(
                  itemCount: controller.ratings.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    const Color.fromARGB(255, 227, 227, 227),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    minLeadingWidth: 0.0,
                                    leading: CircleAvatar(
                                      radius: 22.0,
                                      backgroundColor: Colors.blue[200],
                                      child: Center(
                                        child: Image.asset(ImgAsset.BoyImg,
                                            height: 40),
                                      ),
                                    ),
                                    title: Text(
                                      "${controller.ratings[index]["users_name"]}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    trailing: SizedBox(
                 
                    width: 95, 
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index1) => (index1+1 <= int.parse(controller.ratings[index]["rating_num"]))
                          ? const Icon(Icons.star,
                             
                              color: Color.fromARGB(255, 255, 166, 0))
                          : const Icon(
                              Icons.star_border,
                           
                            ),
                      itemCount: 5,
                    ),
                  ),
                                    subtitle: Text(
                                        DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(controller.ratings[index]['rating_time']))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15, left: 15, bottom: 10.0),
                                    child: Text(
                                      "${controller.ratings[index]['rating_text']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      maxLines: 15,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ]),
                          )),
                    );
                  })),
        ],
      ),
    );
  }
}
