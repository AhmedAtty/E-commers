import 'dart:async';

import 'package:ecommerce1/helper/constans.dart';
import 'package:ecommerce1/view_models/explore_%20view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../views/auth_view/auth_view.dart';

class ExploreView extends GetWidget<ExploreViewModel> {
  ExploreView({Key? key}) : super(key: key);
  final Controller = Get.put(ExploreViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GetBuilder<ExploreViewModel>(builder: (cont) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * .02,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: const Icon(Icons.search),
                  height: 812 * 49 / Get.height,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                ),
                SizedBox(
                  height: Get.height * .04,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 812 * 89 / Get.height,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cont.catList.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 812 * 60 / Get.height,
                              width: 812 * 60 / Get.height,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                child:
                                    SvgPicture.network(cont.catList[index].img),
                              ),
                            ),
                            Spacer(),
                            Text(cont.catList[index].name),
                          ],
                        );
                      })),
                ),
                SizedBox(
                  height: 812 * 320 / Get.height,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cont.bsallList.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                cont.bsallList[index].img,
                                height: 812 * 240 / Get.height,
                                width: 375 * 165 / Get.width,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cont.bsallList[index].name,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      cont.bsallList[index].brand,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "\$ ${cont.bsallList[index].price}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
