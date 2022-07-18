import 'package:ecommerce1/helper/constans.dart';
import 'package:ecommerce1/home_view/track_order_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/account_view_model.dart';
import '../views/auth_view/auth_view.dart';

class AccountView extends GetWidget<AccountViewModel> {
  AccountView({Key? key}) : super(key: key);
  final controller = Get.put(AccountViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 375 * 120 / Get.width,
                  width: 375 * 120 / Get.width,
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: primaryColor,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.25),
                      shape: BoxShape.circle),
                ),
              ),
              Column(
                children: [
                  Text(
                    controller.name,
                    style: TextStyle(fontSize: 26),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(controller.email),
                ],
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(TrackOrderView());
                    final c=Get.put(AccountViewModel());
                    c.orderList.clear();
                    c.getOrders();
                    c.update();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Image.asset(
                          'assets/images/tracking.png',
                        ),
                      ),
                      Text(
                        'Shipping Address',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * .04,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Image.asset(
                          'assets/images/notificat.png',
                        ),
                      ),
                      Text(
                        'Notifications',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * .04,
                ),
                InkWell(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.snackbar(
                      "Signed Out ",
                      "You Should Sign In.",
                      backgroundColor: Colors.white,
                      snackPosition: SnackPosition.TOP,
                      icon: Icon(
                        Icons.mark_email_read,
                      ),
                      duration: const Duration(seconds: 5),
                    );
                    Get.offAll(SignInView());
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Image.asset(
                          'assets/images/logout.png',
                        ),
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * .2,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
