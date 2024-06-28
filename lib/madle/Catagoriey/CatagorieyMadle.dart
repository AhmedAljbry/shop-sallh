class CategoriesModle
{
  late bool status;
  dynamic message;
  late DataCategoriesModle data;
  CategoriesModle.fromjson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=DataCategoriesModle.fromjson(json['data']);
  }
}
class DataCategoriesModle
{
  late int current_page;
  List<CData>data=[];
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
  DataCategoriesModle.fromjson(Map<String,dynamic> json)
  {
    current_page=json['current_page'];
    json['data']..forEach((element) {
      data.add(CData.fromjson(element));
    });
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
class CData
{
  late int id;
  late String name;
  late String image;
  CData.fromjson(Map<String,dynamic> json)
  {
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }
}