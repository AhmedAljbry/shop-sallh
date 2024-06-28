class SerachHomeModle
{
  late bool status;
  dynamic message;
  late SerachDataModle data;
  SerachHomeModle.formjson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
    data=SerachDataModle.fromjson(json['data']);
  }
}
class SerachDataModle
{
  List<SerachProductsModle> data=[];
  late int current_page;
  late String first_page_url;
  late int from;
  late int last_page;
  late String last_page_url;
  dynamic next_page_url;
  late String path;
  late int per_page;
  dynamic prev_page_url;
  late int to;
  late int total;
  SerachDataModle.fromjson(Map<String,dynamic>json)
  {
    json['data'].forEach((element) {
      data.add(SerachProductsModle.fromjson(element));
    });
    current_page=json['current_page'];
    first_page_url=json['first_page_url'];
    from=json['from'];
    last_page=json['last_page'];
    last_page_url=json['last_page_url'];
    next_page_url=json['next_page_url'];
    path=json['path'];
    per_page=json['per_page'];
    prev_page_url=json['prev_page_url'];
    to=json['to'];
    total=json['total'];
  }
}

class SerachProductsModle
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
  SerachProductsModle.fromjson(Map<String,dynamic>json)
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


