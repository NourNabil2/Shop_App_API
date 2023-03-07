class ShopModelData
{
  bool? status ;
  String? message ;

  datalogin? data;


  ShopModelData.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new datalogin.fromJson(json['data']) : null;

}

}
class datalogin
{
  int? id;
  String? name;
  String? email;
  String? phone;
  String?image;
  String? token;
  int? credit;

  datalogin.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
    credit = json['credit'];
  }
}