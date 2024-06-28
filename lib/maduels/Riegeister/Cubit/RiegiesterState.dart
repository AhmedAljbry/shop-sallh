

import 'package:shop_sallh/madle/LoginMadle.dart';

abstract class RiegiesterState {}
class RiegiesterInitlState extends RiegiesterState {}
class RiegiesterLodingState extends RiegiesterState {}
class RiegiesterSecssesState extends RiegiesterState {
  LoginModle login;
  RiegiesterSecssesState(this.login);
}
class RiegiesterErrorState extends RiegiesterState {
  late String err;
  RiegiesterErrorState(this.err);
}
class AppVisbiltyPasswordState extends RiegiesterState {}
