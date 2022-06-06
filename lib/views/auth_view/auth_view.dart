
import 'package:ecommerce1/views/auth_view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helper/constans.dart';
import '../../view_models/auth_view_model.dart';
import '../../widgets/defalut-big-Button.dart';

class SignInView extends GetWidget<AuthViewModel> {
  SignInView({Key? key}) : super(key: key);

  @override
  final controller = Get.put(AuthViewModel());
 final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
 TextEditingController emailController =TextEditingController();
  TextEditingController pasController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 95 / Get.height,
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Welcome,',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: fontColor),
                          ),
                          const Spacer(),
                          InkWell(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: primaryColor),
                            ),
                            onTap: () {
                              Get.to(SignUpView());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 10 / Get.height,
                      ),
                      Text(
                        'Sign in to Continue',
                        //textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: fontColor.withOpacity(.5)),
                      ),
                      SizedBox(
                        height: Get.height * 30 / Get.height,
                      ),
                      Text(
                        'Email',
                        //textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: fontColor.withOpacity(.5)),
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "type your email";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "iamdavid@gmail.com",
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 30 / Get.height,
                      ),
                      Text(
                        'Password',
                        //textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: fontColor.withOpacity(.5)),
                      ),
                      TextFormField(
                        controller: pasController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "type your password";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "password",
                        ),
                      ),
                      Row(
                        children: const [
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'forget Password?',
                              //textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 14, color: fontColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 20 / Get.height,
                      ),
                      DefultBigButton(
                        txt: 'SIGN IN',
                        ontab: () {
                          if(_formKey.currentState!.validate()){
                            controller.signIn(emailController.text, pasController.text);
                          }
                        },
                      ),
                      SizedBox(
                        height: Get.height * 20 / Get.height,
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                      color: backGroundColor,
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              const Center(
                child: Text(
                  "-OR-",
                  style: TextStyle(
                    fontSize: 20,
                    color: fontColor,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 20 / Get.height,
              ),
              Container(
                color: backGroundColor,
                  height: Get.height * 50 / Get.height,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset("assets/images/google.svg"),
                        ),
                        const Text("Sign In with Google"),
                        SizedBox(
                          height: Get.width * 20 / Get.width,
                        ),
                      ],
                    ),
                  )

              ),
              SizedBox(
                height: Get.height * 30 / Get.height,
              ),
              Container(
                color: backGroundColor,
                  height: Get.height * 50 / Get.height,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset("assets/images/facebook.svg"),
                        ),
                        const Text("Sign In with Facebook"),
                        SizedBox(
                          height: Get.width * 50 / Get.width,
                        ),
                      ],
                    ),
                  )

              ),
            ],
          ),
        ),
      ),
    );
  }
}
