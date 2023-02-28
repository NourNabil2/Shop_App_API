class ShopModelData
{
  bool? status ;
  String? message ;

  int? id;
  String? name;
  String? email;
  String? phone;
  String?image;
  String? token;
  int? credit;
  ShopModelData.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
    credit = json['credit'];
}

}
