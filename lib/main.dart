import 'package:ecommerce1/theme/theme.dart';
import 'package:ecommerce1/views/auth_view/auth_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'home_view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    print(user.email);
  }
  runApp(
    GetMaterialApp(
      home: AnimatedSplashScreen(
        nextScreen: user == null ? SignInView() : const Home(),
        splash: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover)),
        ),
        duration: 3000,
        curve: Curves.easeInCirc,
        splashIconSize: 2000,
        splashTransition: SplashTransition.fadeTransition,
      ),
      theme: getThemeData(),
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
