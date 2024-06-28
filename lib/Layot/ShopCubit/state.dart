

import 'package:shop_sallh/madle/Favoriet/ChangeFavorietModle.dart';
import 'package:shop_sallh/madle/LoginMadle.dart';

abstract class AppShopState {}
class AppShopinitlstate extends AppShopState {}
class AppShopBottomNavigationBar extends AppShopState {}
class AppLodingShopHomeState extends AppShopState {}
class AppSecssuesShopHomeState extends AppShopState {}
class AppErrorShopHomeState extends AppShopState {
  final String err;


  AppErrorShopHomeState(this.err);}
class AppLodingShopCatagoieryState extends AppShopState {}
class AppSecssuesShopCatagoieryState extends AppShopState {}
class AppErrorShopCatagoieryState extends AppShopState {
  final String err;


  AppErrorShopCatagoieryState(this.err);}
class AppLodingShopChangeFavorietyState extends AppShopState {}
class AppChangeShopFoveriteState extends AppShopState {
  ChangeFavorietModle changeDataFavorite;
  AppChangeShopFoveriteState(this.changeDataFavorite);
}
class AppChangeErrorShopFavoriteState extends AppShopState {
  final String err;


  AppChangeErrorShopFavoriteState(this.err);

}
class AppLodingShopFavorietyState extends AppShopState {}
class AppSecssuesShopFoveriteState extends AppShopState {}
class AppErrorShopFavoriteState extends AppShopState {
  final String err;


  AppErrorShopFavoriteState(this.err);

}
class AppLodingShopSettingesState extends AppShopState {}
class AppSecssuesShopSettingesState extends AppShopState {}
class AppErrorShopSettingesState extends AppShopState {
  final String err;


  AppErrorShopSettingesState(this.err);

}
class AppLodingShopUpdateState extends AppShopState {}
class AppSecssuesShopUpdateState extends AppShopState {
  LoginModle update;
   AppSecssuesShopUpdateState(this.update);
}
class AppErrorShopUpdatesState extends AppShopState {
  final String err;


  AppErrorShopUpdatesState(this.err);

}
class AppLodingShopSerachState extends AppShopState {}
class AppSecssuesShopSerachState extends AppShopState {
}
class AppErrorShopSerachsState extends AppShopState {
  final String err;


  AppErrorShopSerachsState(this.err);

}
