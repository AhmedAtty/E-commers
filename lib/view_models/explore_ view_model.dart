import 'package:ecommerce1/models/best_salling_model.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExploreViewModel extends GetxController {

  List<CategoryModel> catList = [];
  List<BestSallingModel> bsallList = [];


  CollectionReference categoriesRef =
      FirebaseFirestore.instance.collection("Categories");


  CollectionReference bestRef =
  FirebaseFirestore.instance.collection("bestSalling");


  Future<void> getCategories() async {
    await categoriesRef.get().then((value) {
      for (var i in value.docs) {
        catList.add(CategoryModel.fromMap(i));
      }
      update();
    });
  }

  Future<void> getBestSalling() async {
    await bestRef.get().then((value) {
      for (var i in value.docs) {
       bsallList.add(BestSallingModel.fromMap(i));
       print(i["name"]);
      }

      update();
    });
  }

  @override
  void onInit() {
    getBestSalling();
     getCategories();

    // TODO: implement onInit
    super.onInit();
  }
}
