class LoginModle
{
  late bool status;
  late dynamic message;
   Logindata? data;
LoginModle.fromjson(Map<String,dynamic> json)
{
  status = json['status'];
  message = json['message'];
  data = json['data'] != null ? Logindata.fromjson( json['data'] ) : null ;
}
}
class Logindata
{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;
  Logindata.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    token=json['token'];
  }
}