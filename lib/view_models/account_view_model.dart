import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce1/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AccountViewModel extends GetxController {
  late String name;
  late String email;

  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  CollectionReference orderRef =
      FirebaseFirestore.instance.collection('orders');

  List<OrderModel> orderList = [];



  Future<void> getData() async {

    await userRef
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      email = value.docs[0]['email'];
      name = value.docs[0]['name'];
    });
    update();
  }

  Future<void> getOrders() async {
    await orderRef
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      for (var i in value.docs) {
        orderList.add(OrderModel(
            adderss: i['adderss'],
            isDelivired: i['isDelivired'],
            img: i['order'][0]['img']));
      }
      update();
    });
  }

  @override
  void onInit() {
    orderList.clear();
    getOrders();
    getData();
    update();
    super.onInit();
  }
}
