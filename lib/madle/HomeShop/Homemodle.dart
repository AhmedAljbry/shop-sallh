class HomeModle
{
  late bool status;
  dynamic message;
  late DataModle data;
  HomeModle.formjson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
    data=DataModle.fromjson(json['data']);
  }
}
class DataModle
{
  List<BannersModle> banners=[];
  List<ProductsModle> products=[];
  DataModle.fromjson(Map<String,dynamic>json)
  {
    json['banners'].forEach((element) {
      banners.add(BannersModle.fromjson(element));
    });
    json['products'].forEach((element) {
      products.add(ProductsModle.fromjson(element));
    });
  }
}
class BannersModle
{
  late int id;
  late String image;
  BannersModle.fromjson(Map<String,dynamic>json)
  {
   id=json['id'];
   image=json['image'];
  }
}
class ProductsModle
{
  late int id;
  dynamic price;
  dynamic old_price;
  late int discount;
  late String image;
  late String name;
  late String description;
  late bool in_favorites;
  late bool in_cart;
  ProductsModle.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    price=json['price'];
    old_price=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    description=json['description'];
    in_favorites=json['in_favorites'];
    in_cart=json['in_cart'];
  }
}


