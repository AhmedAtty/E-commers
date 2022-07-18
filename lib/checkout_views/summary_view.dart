import 'package:ecommerce1/helper/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/cart_view_model.dart';
import '../widgets/defalut_small_batton.dart';

class SummaryView extends GetWidget<CartViewModel> {
  SummaryView({Key? key}) : super(key: key);
  final controller = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Summary',
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
          child: Column(
            children: [
              SizedBox(
                height: 812 * 300 / Get.height,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.cartList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 812 * 180 / Get.height,
                            width: 812 * 180 / Get.height,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      controller.cartList[index].img,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              controller.cartList[index].name,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "\$ ${controller.cartList[index].price}",
                              style: TextStyle(fontSize: 16, color: primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),


                        ],
                      );
                    }),
              ),
              Divider(
                thickness: .7,
              ),
              Row(
                children: [
                  SizedBox(
                    height: Get.height*.2,
                    width: Get.width*.8,
                    child: ListTile(
                      title: const Text(
                        'Shiping Address',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${controller.country.text},${controller.state.text},${controller.city.text},${controller.street.text}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/checkbox.png'),
                  ),
                ],
              ),
              Divider(
                thickness: .7,
              ),
              Spacer(),
              Container(
                width: Get.width,
                height: 812 * 85 / Get.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmallBattonWidget(
                        name: "BACK",
                        ontap: () {
                          controller.pageController.animateToPage(
                            0,
                            duration: Duration(seconds: 1),
                            curve: Curves.ease,
                          );
                          controller.update();
                        }),
                    SmallBattonWidget(
                        name: "ORDER",
                        ontap: () {
                          controller.sendOrder();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
