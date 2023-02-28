class CategoriesModel
{
  bool? status ;
  ALLDataCategories? data;

  CategoriesModel.fromjson(Map<String, dynamic> json )
  {
    status = json['status'];
    data = ALLDataCategories.fromjson(json['data']);

  }
}

class ALLDataCategories
{
  int? current_page;
  List<Listdata> data = [];

  ALLDataCategories.fromjson(Map<String ,dynamic> json)
  {
    current_page=json['current_page'];

    json['data'].forEach((e){
      data.add(Listdata.fromjson(e));
    });
  }
}


class Listdata
{
  int? id;
  String? name;
  String? image ;
  Listdata.fromjson(Map<String ,dynamic> json )
  {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
