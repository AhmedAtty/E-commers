import 'package:ecommerce1/home_view/account.dart';
import 'package:ecommerce1/home_view/cart.dart';
import 'package:ecommerce1/home_view/explore_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> bodyList=[ExploreView(),CartView(),AccountView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        // selectedFontSize:25 ,
        // unselectedItemColor: Colors.blue,
        // selectedIconTheme: IconThemeData(size: 30),
        // selectedItemColor:Colors.red ,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/Explore.png"),
              icon: SvgPicture.asset("assets/images/explor.svg"),
              label: "Home"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/Cart.png"),
              icon: SvgPicture.asset("assets/images/cart.svg"),
              label: "Cart"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/Account.png"),
              icon: SvgPicture.asset("assets/images/accont.svg"),
              label: "Accont"),
        ],
      ),
      body: bodyList[currentIndex],
    );
  }
}
