class UpdataModle
{
  late bool status;
  dynamic message;
  late UpdataData data;
  UpdataModle.fromjson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=UpdataData.fromjson(json['data']);
  }
}
class UpdataData
{
  late String name;
  late String phone;
  late String email;
  late String password;
  late String token;
  UpdataData.fromjson(Map<String,dynamic> json)
  {
    name=json['name'];
    phone=json['phone'];
    email=json['email'];
    password=json['password'];
    token=json['token'];
  }
}