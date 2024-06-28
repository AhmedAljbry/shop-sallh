class SettingeModle
{
  late bool status;
  dynamic message;
  late SettingesData data;
  SettingeModle.formjson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=SettingesData.formjson(json['data']);
  }
}
class SettingesData
{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;
SettingesData.formjson(Map<String,dynamic> json)
{
 id=json['id'];
 name=json['name'];
 email=json['email'];
 phone=json['phone'];
 image=json['image'];
 token=json['token'];
}
}