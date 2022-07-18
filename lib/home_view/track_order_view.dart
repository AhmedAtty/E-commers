import 'dart:async';

import 'package:ecommerce1/helper/constans.dart';
import 'package:ecommerce1/view_models/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackOrderView extends GetWidget<AccountViewModel> {
  TrackOrderView({Key? key}) : super(key: key);
  final controller = Get.put(AccountViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Track Order',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: () async {
            controller.orderList.clear();
            controller.getOrders();
            controller.update();
          },
          child: GetBuilder<AccountViewModel>(
            builder:(cont)=> ListView.builder(
              itemCount: controller.orderList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: SizedBox(
                    height: 812 * 160 / Get.height,
                    width: 375 * 343 / Get.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                cont.orderList[index].adderss!,
                                style: TextStyle(fontSize: 16),
                              ),
                              cont.orderList[index].isDelivired == false
                                  ? Container(
                                      height: 812 * 30 / Get.height,
                                      width: 375 * 80 / Get.width,
                                      child: Center(
                                          child: Text(
                                        'In Transit',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFB900),
                                      ),
                                    )
                                  : Container(
                                      height: 812 * 30 / Get.height,
                                      width: 375 * 90 / Get.width,
                                      child: Center(
                                          child: Text(
                                        'is Delivired',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 375 * 120 / Get.width,
                          width: 375 * 120 / Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    cont.orderList[index].img!),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}
