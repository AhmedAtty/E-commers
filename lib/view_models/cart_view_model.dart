import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce1/helper/db_helper.dart';
import 'package:ecommerce1/home_view/cart_view.dart';
import 'package:ecommerce1/models/cart_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartViewModel extends GetxController {
  late DBHelper dbHelper;
  List<CartPruduct> cartList = [];
  var total = 0;
  PageController pageController = PageController();
  CollectionReference ordersRef =
  FirebaseFirestore.instance.collection('orders');

  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();

  @override
  void onInit() {
    dbHelper = DBHelper();
    dbHelper.createDatabase();
    getAllToCart();
    calcTotal();
    super.onInit();
  }

  Future<void> addToCart(CartPruduct cartProduct) async {
    await dbHelper.createPruduct(cartProduct);
    getAllToCart();
  }

  Future<void> getAllToCart() async {
    cartList.clear();

    dbHelper.allPruducts().then((value) {
      for (var i in value) {
        cartList.add(CartPruduct.fromMap(i));
      }
      calcTotal();
    });
    update();
  }

  Future<void> deleteFromCart(int id) async {
    await dbHelper.delete(id);
    getAllToCart();
    calcTotal();
  }

  calcTotal() {
    dbHelper.allPruducts().then((value) {
      total = 0;

      for (var i in value) {
        total = total +
            (int.parse(i['price'].toString()) *
                (int.parse(i['count'].toString())));
      }
    });
    update();
    return total;
  }

  void increse(int index) {
    cartList[index].count++;
    dbHelper.update(cartList[index]).then((value) {
      calcTotal();
    });
    update();
  }

  void decrese(int index) {
    if (cartList[index].count != 1) {
      cartList[index].count--;
      dbHelper.update(cartList[index]).then((value) {
        calcTotal();
      });
      update();
    }
  }

  Future<void> sendOrder() async {
    List<Map> list = [];
    for (var i in cartList) {
      list.add(i.toMap());
    }
    await ordersRef.doc().set({
    'adderss': '${country.text},${state.text},${city.text},${street.text}',
    'uid': FirebaseAuth.instance.currentUser!.uid,
    'order': list,
    'isDelivired' :false,
    }).then((value) {
      Get.back();
      Get.snackbar('Done', "order added");
      cartList.clear();
      dbHelper.clear();
      update();
    });
    calcTotal();
    update();
  }
}
