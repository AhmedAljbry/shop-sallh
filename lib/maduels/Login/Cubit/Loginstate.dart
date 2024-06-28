

import 'package:shop_sallh/madle/LoginMadle.dart';

abstract class LoginShopState{}
class initlLoginShopState extends LoginShopState {}
class AppLodingShopLoginState extends LoginShopState{}
class AppSecssuesShopLoginState extends LoginShopState{
  late LoginModle login;
  AppSecssuesShopLoginState(this.login);
}
class AppErrorShopLoginState extends LoginShopState{
  late  String err;
  AppErrorShopLoginState(this.err);
}
class AppVisbiltyPasswordState extends LoginShopState{}
