import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
   ImageView({Key? key, required this.image}) : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: 'img',
          child: Image.network(image),
        ),
      ),
    );
  }
}
