class ChangeFavorietModle
{
 late bool status;
 late String message;
 late ChangeDataFavorite data;
 ChangeFavorietModle.formjson(Map<String,dynamic> json)
 {
   status=json['status'];
   message=json['message'];
   data=ChangeDataFavorite.formjson(json['data']);
 }
}
class ChangeDataFavorite
{
  late int id;
  late ChangeDataProduectFavorite product;
  ChangeDataFavorite.formjson(Map<String,dynamic> json)
  {
    id=json['id'];
    product=ChangeDataProduectFavorite.formjson(json['product']);
  }
}
class ChangeDataProduectFavorite
{
  late int id;
  dynamic price;
  dynamic old_price;
  late int discount;
  late String image;
  ChangeDataProduectFavorite.formjson(Map<String,dynamic>json)
  {
    id=json['id'];
    price=json['price'];
    old_price=json['old_price'];
    discount=json['discount'];
    image=json['image'];
  }
}