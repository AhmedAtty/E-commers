import 'package:ecommerce1/checkout_views/checkout_form.dart';
import 'package:ecommerce1/checkout_views/summary_view.dart';
import 'package:ecommerce1/home_view/account.dart';
import 'package:ecommerce1/home_view/cart_view.dart';
import 'package:ecommerce1/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutView extends GetWidget<CartViewModel> {
  CheckOutView({Key? key}) : super(key: key);



  final controller = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(
        physics: ScrollPhysics(parent:  NeverScrollableScrollPhysics()),
        controller: controller.pageController,
        children: [
          CheckOutForm(),
          SummaryView(),
        ],
      ),
    ));
  }
}
