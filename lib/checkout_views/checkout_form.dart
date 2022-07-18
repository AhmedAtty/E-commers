import 'package:ecommerce1/checkout_views/summary_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/constans.dart';
import '../view_models/cart_view_model.dart';
import '../widgets/defalut_small_batton.dart';
import 'checkout_view.dart';

class CheckOutForm extends GetWidget<CartViewModel> {
  CheckOutForm({Key? key}) : super(key: key);
  final controller = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * .08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/checkbox.png'),
                const Text('Billing address is the same as delivery address'),
              ],
            ),
            SizedBox(
              height: Get.height * .08,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Street'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: controller.street,
                decoration: const InputDecoration(
                  hintText: '21, Alex Davidson Avenue',
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .03,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('City'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: TextFormField(
                controller: controller.city,
                decoration: const InputDecoration(
                  hintText: 'Opposite Omegatron, Vicent Quarters',
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Country'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        child: TextFormField(
                          controller: controller.country,
                          decoration: const InputDecoration(
                            hintText: 'Victoria Island',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('State'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        child: TextFormField(
                          controller: controller.state,
                          decoration: const InputDecoration(
                            hintText: 'Nigeria',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * .25,
            ),
            Container(
              width: Get.width,
              height: 812 * 85 / Get.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmallBattonWidget(
                      name: "BACK",
                      ontap: () {
                        Get.back();
                      }),
                  SmallBattonWidget(
                      name: "NEXT",
                      ontap: () {
                        controller.pageController.animateToPage(
                          2,
                          duration: Duration(seconds: 1),
                          curve: Curves.ease,
                        );
                        controller.update();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
