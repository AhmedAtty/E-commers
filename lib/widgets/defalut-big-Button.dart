import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/constans.dart';

class DefultBigButton extends StatelessWidget {
  DefultBigButton({Key? key, required this.txt, required this.ontab})
      : super(key: key);
  final String txt;
  final void Function() ontab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontab,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          txt,
          style: const TextStyle(fontSize: 14, color: backGroundColor),
        ),
        height: Get.height * 50 / Get.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: primaryColor,
        ),
      ),
    );
  }
}
