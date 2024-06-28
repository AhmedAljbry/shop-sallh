

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/madle/LoginMadle.dart';
import 'package:shop_sallh/maduels/Riegeister/Cubit/RiegiesterState.dart';
import 'package:shop_sallh/shared/network/endpoint.dart';
import 'package:shop_sallh/shared/network/local/diohelper.dart';

class RiegiesterCubit extends Cubit<RiegiesterState>
{
  RiegiesterCubit() :super(RiegiesterInitlState());
  RiegiesterCubit get(context)=>BlocProvider.of(context);
  LoginModle? loginmodle;
  bool ispassword=true;
  void createRigester({
    required String name,
    required String email,
    required String phone,
    required String password,
})
  {
    emit(RiegiesterLodingState());
    DioHalper.postdata(url: REGISTER, data:
    {
      'name':name,
      'email':email,
      'password':password,
      'phone':phone,
    }).then((value) {
      loginmodle=LoginModle.fromjson(value.data);
      print(value.data);

      emit(RiegiesterSecssesState(loginmodle!));
    }).catchError((err)
    {
      emit(RiegiesterErrorState(err.toString()));
      print(err.toString());
    });
  }
  void IsPassword()
  {
    ispassword = !ispassword;
    emit(AppVisbiltyPasswordState());
  }
}