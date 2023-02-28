
class HomeModelData {
  bool? status;
  HomeData? data;


  HomeModelData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeData.fromJson(json['data']);
  }
}

class HomeData {
 List<Banners> banners =[];
 List<Products> products=[];

  HomeData.fromJson(Map<String , dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(Banners.fromJson(element));

    });
    json['products'].forEach((element) {
      products.add(Products.fromJson(element));
    });
  }
}

class Banners {
  var id;
  String? image;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class Products {
  var id;
  String? name;
  String? image;
  var price;
  var old_price;
  var discount;
  bool? in_favorites;
  bool? in_cart;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name= json['name'];
    image = json['image'];
    price= json['price'];
    old_price= json['old_price'];
    discount= json['discount'];
    in_favorites= json['in_favorites'];
    in_cart= json['in_cart'];
  }
}


