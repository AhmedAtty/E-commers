import 'package:ecommerce1/theme/theme.dart';
import 'package:ecommerce1/views/auth_view/auth_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if(user!=null){
     print(user.email);
  }
  runApp(
    GetMaterialApp(
      home:user==null? SignInView(): const Home(),
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
