


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/madle/Serachmodle/SerachModle.dart';
import 'package:shop_sallh/maduels/Serach/SerachCubit/serachstate.dart';
import 'package:shop_sallh/shared/components/constanet.dart';
import 'package:shop_sallh/shared/network/endpoint.dart';
import 'package:shop_sallh/shared/network/local/diohelper.dart';

class AppSerachCubit extends Cubit<AppSerachState>
{
  AppSerachCubit() : super(AppSerachInitleState());
  AppSerachCubit get(context)=>BlocProvider.of(context);

  SerachHomeModle? serachmodle;
  postserach({required String Serach})
  {
    emit(AppLodingSerachState());
    DioHalper.postdata(url: SERACH, data: {
      'text':Serach,
    },token: token,lang:'en').then((value)
    {
      serachmodle=SerachHomeModle.formjson(value.data);
      print(value.data);
      emit(AppSecsseusSerachState());
    }
    ).catchError((err)
    {
      emit(AppErroreSerachState(err.toString()));
      print(err.toString());
    });
  }
}