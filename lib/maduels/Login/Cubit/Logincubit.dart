

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/madle/LoginMadle.dart';
import 'package:shop_sallh/maduels/Login/Cubit/Loginstate.dart';
import 'package:shop_sallh/shared/network/endpoint.dart';
import 'package:shop_sallh/shared/network/local/diohelper.dart';

class AppShopLoginCubit extends Cubit<LoginShopState>
{
  AppShopLoginCubit():super(initlLoginShopState());
  static AppShopLoginCubit get(context)=>BlocProvider.of(context);
  LoginModle? loginmodle;
  bool ispassword=true;
  late IconData icon;
  void postlogindata({
    required String email,
    required String password,
})
  {
    emit(AppLodingShopLoginState());
   DioHalper.postdata(url: LOGIN, data:
    {
    'email':email,
      'password':password,
    }).then((value) {
      loginmodle=LoginModle.fromjson(value.data);
      print(value.data);
      emit(AppSecssuesShopLoginState(loginmodle!));
    }).catchError((err)
    {
      emit(AppErrorShopLoginState(err.toString()));
      print(err.toString());
    });
  }
void IsPassword()
{
  ispassword = !ispassword;
  emit(AppVisbiltyPasswordState());
}
}