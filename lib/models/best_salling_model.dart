class BestSallingModel {
  String name;
  String brand;
  String detals;
  String color;
  String image;
  String price;

//<editor-fold desc="Data Methods">

  BestSallingModel({
    required this.name,
    required this.brand,
    required this.detals,
    required this.color,
    required this.image,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'brand': this.brand,
      'detals': this.detals,
      'color': this.color,
      'image': this.image,
      'price': this.price,
    };
  }

  factory BestSallingModel.fromMap( map) {
    return BestSallingModel(
      name: map['name'] as String,
      brand: map['brand'] as String,
      detals: map['detals'] as String,
      color: map['color'] as String,
      image: map['image'] as String,
      price: map['price'] as String,
    );
  }
}
