
import 'package:ecommerce1/view_models/cart_view_model.dart';
import 'package:ecommerce1/view_models/explore_%20view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../view_models/account_view_model.dart';
import '../view_models/auth_view_model.dart';

class Binding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ExploreViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => AccountViewModel());
  }

}