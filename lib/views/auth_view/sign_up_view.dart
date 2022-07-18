import 'package:ecommerce1/views/auth_view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/constans.dart';
import '../../view_models/auth_view_model.dart';
import '../../widgets/defalut-big-Button.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({Key? key}) : super(key: key);

  @override
  final controller = Get.put(AuthViewModel());
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  TextEditingController nameController =TextEditingController();
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
                        children:  [
                          const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: fontColor),
                          ),
                          const Spacer(),
                          InkWell(
                            child:  const Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: primaryColor),
                            ),
                            onTap: () {
                              Get.to(SignInView());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 10 / Get.height,
                      ),
                      // Text(
                      //   'Sign Up to Continue',
                      //   //textAlign: TextAlign.start,
                      //   style: TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //       color: fontColor.withOpacity(.5)),
                      // ),
                      SizedBox(
                        height: Get.height * 30 / Get.height,
                      ),
                      Text(
                        'Name',
                        //textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: fontColor.withOpacity(.5)),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "type your Name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "your name",
                        ),
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
                        keyboardType: TextInputType.emailAddress,
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
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 20 / Get.height,
                      ),
                      DefultBigButton(
                        txt: 'SIGN IN',
                        ontab: () {
                          if(_formKey.currentState!.validate()){
                            controller.signUp(emailController.text, pasController.text,nameController.text);
                            print( pasController.text);
                            print( 'pasController.text');
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


            ],
          ),
        ),
      ),
    );
  }
}
