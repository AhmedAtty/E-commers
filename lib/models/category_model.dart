import 'dart:convert';

class CategoryModel {
  String img;
  String name;

  CategoryModel({
    required this.img,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'name': name,
    };
  }

  factory CategoryModel.fromMap(map) {
    return CategoryModel(
      img: map["img"] ?? '',
      name: map["name"] ?? '',
    );
  }
//

}
