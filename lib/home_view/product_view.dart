import 'package:ecommerce1/helper/constans.dart';
import 'package:ecommerce1/home_view/image_view.dart';
import 'package:ecommerce1/models/cart_product.dart';
import 'package:ecommerce1/view_models/cart_view_model.dart';
import 'package:ecommerce1/widgets/defalut_small_batton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  ProductView({
    Key? key,
    required this.name,
    required this.detals,
    required this.color,
    required this.image,
    required this.price,
  }) : super(key: key);

  final String name;
  final String detals;
  final String color;
  final String image;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 812 * 195 / Get.height,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          InkWell(
                            child: Hero(
                              tag: 'img',
                              child: Image.network(
                                image,
                                height: 812 * 195 / Get.height,
                                width: double.infinity,
                              ),
                            ),
                            onTap: () {
                              Get.to(ImageView(image: image));
                            },
                          ),
                          Positioned(
                              top: 812 * 70 / Get.height,
                              child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back_ios_outlined),
                              )),
                          Positioned(
                              right: 10,
                              top: 812 * 70 / Get.height,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(Icons.star_border_outlined),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 812 * 20 / Get.height,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    SizedBox(
                      height: 812 * 20 / Get.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Size"),
                              Text("XL"),
                            ],
                          ),
                          height: 812 * 40 / Get.height,
                          width: 375 * 180 / Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Colour"),
                              Container(
                                  height: 812 * 22 / Get.height,
                                  width: 812 * 22 / Get.height,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(int.parse('0xff$color')),
                                  )),
                            ],
                          ),
                          height: 812 * 40 / Get.height,
                          width: 375 * 180 / Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 812 * 20 / Get.height,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 812 * 20 / Get.height,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        detals,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
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
                          'PRICE',
                          style: TextStyle(),
                        ),
                        SizedBox(
                          height: 812 * 6 / Get.height,
                        ),
                        Text(
                          '\$${price}',
                          style: const TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SmallBattonWidget(
                        name: 'ADD',
                        ontap: () {
                          final cont = Get.put(CartViewModel());
                          cont.addToCart(CartPruduct(
                              name: name,
                              img: image,
                              price: price,
                              count: 1));
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
