class CartPruduct {
  int? id;
  String name;
  String img;
  String price;
  int count  ;

//<editor-fold desc="Data Methods">

  CartPruduct({
    this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'img': this.img,
      'price': this.price,
      'count': this.count,
    };
  }

  factory CartPruduct.fromMap(map) {
    return CartPruduct(
      id: map['id'] as int,
      name: map['name'] as String,
      img: map['img'] as String,
      price: map['price'] as String,
      count: map['count'] as int,
    );
  }

//</editor-fold>
}