import 'package:ecommerce1/checkout_views/checkout_view.dart';
import 'package:ecommerce1/view_models/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../helper/constans.dart';
import '../widgets/defalut_small_batton.dart';

class CartView extends GetWidget<CartViewModel> {
  CartView({Key? key}) : super(key: key);

  final controller = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartViewModel>(
        builder: (cont) => Column(
          children: [
            Expanded(
                child: (SizedBox(
              child: ListView.builder(
                  itemCount: cont.cartList.length,
                  itemBuilder: ((context, index) {
                    return Slidable(
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              cont.deleteFromCart(cont.cartList[index].id!);
                              cont.calcTotal();
                            },
                            backgroundColor: Color(0xFFFF3D00),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            onPressed: (context) {},
                            backgroundColor: Color(0xffFFC107),
                            foregroundColor: Colors.white,
                            icon: Icons.star,
                            label: 'Star',
                          ),
                        ],
                      ),
                      child: Container(
                        height: 812 * 120 / Get.height,
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                              cont.cartList[index].img,
                              height: 375 * 120 / Get.width,
                              width: 375 * 120 / Get.width,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: Get.width * .08,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(cont.cartList[index].name,
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                    '\$ ${cont.cartList[index].price}',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 16),
                                  ),
                                  Container(
                                    height: 812 * 30 / Get.height,
                                    color: Colors.grey[300],
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              cont.increse(index);
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              size: 15,
                                            )),
                                        Text(cont.cartList[index].count
                                            .toString()),
                                        IconButton(
                                            onPressed: () {
                                              cont.decrese(index);
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                              size: 15,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ))),
            Container(
              width: double.infinity,
              height: 812 * 85 / Get.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'TOTAL',
                        style: TextStyle(),
                      ),
                      SizedBox(
                        height: 812 * 6 / Get.height,
                      ),
                      Text(
                        '\$ ${cont.calcTotal()}',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SmallBattonWidget(name: "CHECKOUT", ontap: () {
                    Get.to(CheckOutView());
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
