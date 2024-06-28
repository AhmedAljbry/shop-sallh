

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/Layot/ShopCubit/state.dart';
import 'package:shop_sallh/madle/Catagoriey/CatagorieyMadle.dart';
import 'package:shop_sallh/madle/Favoriet/ChangeFavorietModle.dart';
import 'package:shop_sallh/madle/Favoriet/GetFavoriet.dart';
import 'package:shop_sallh/madle/HomeShop/Homemodle.dart';
import 'package:shop_sallh/madle/LoginMadle.dart';
import 'package:shop_sallh/maduels/Catagoriy/CatagoriyScreen.dart';
import 'package:shop_sallh/maduels/Producat/ProduactScreen.dart';
import 'package:shop_sallh/maduels/Settinges/SettingesScreen.dart';
import 'package:shop_sallh/maduels/favoriet/FavoriatScreen.dart';
import 'package:shop_sallh/shared/components/constanet.dart';
import 'package:shop_sallh/shared/network/endpoint.dart';
import 'package:shop_sallh/shared/network/local/diohelper.dart';

class AppShopCubit extends Cubit<AppShopState> {
  AppShopCubit() :super(AppShopinitlstate());

  AppShopCubit get(context) => BlocProvider.of(context);
  List<Widget> screen =
  [
    ProduactScreen(),
    CatagoriyScreen(),
    FavoriatScreen(),
    SettingScreen(),
  ];
  List<BottomNavigationBarItem> bottomnavigationbarItem =
  [
    BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: 'Catagoriy', icon: Icon(Icons.apps)),
    BottomNavigationBarItem(label: 'Favoriat', icon: Icon(Icons.favorite)),
    BottomNavigationBarItem(label: 'Setting', icon: Icon(Icons.settings)),
  ];
  late int creentscreen = 0;

  void changebottomnavigationbaritem(index) {
    creentscreen = index;
    emit(AppShopBottomNavigationBar());
  }

  HomeModle? homemodle;

  void gethomedata() {
    emit(AppLodingShopHomeState());
    DioHalper.getdata(url: HOME, token: token, lang: 'en').then((value) {
      homemodle = HomeModle.formjson(value.data);
      homemodle!.data.products.forEach((element) {
        changefavorietmodle.addAll({
        element.id:element.in_favorites,
        });
      });
      emit(AppSecssuesShopHomeState());
    }
    ).catchError((err) {
      emit(AppErrorShopHomeState(err.toString()));
      print(err.toString());
    }
    );
  }

  CategoriesModle? categoriesmodle;

  void getcatagorydata() {
    emit(AppLodingShopCatagoieryState());
    DioHalper.getdata(url: CATEGORIES, token: token, lang: 'en').then((value) {
      categoriesmodle = CategoriesModle.fromjson(value.data);
      
      emit(AppSecssuesShopCatagoieryState());
    }
    ).catchError((err) {
      emit(AppErrorShopCatagoieryState(err.toString()));
      print(err.toString());
    }
    );
  }
  Map<int,bool> changefavorietmodle={};
  ChangeFavorietModle? chfav;
  void getchangefovrite(int index)
  {
    emit(AppLodingShopChangeFavorietyState());
    changefavorietmodle[index] = !changefavorietmodle[index]!;
    DioHalper.postdata(url:CHANGEFAVORIATE, data:{
      'product_id':index,
    },token: token).then((value) 
    {
      chfav=ChangeFavorietModle.formjson(value.data);
     if(!chfav!.status)
       {
         changefavorietmodle[index] = !changefavorietmodle[index]!;
       }
     else
       {
         FavoriteData();
       }
      emit(AppChangeShopFoveriteState(chfav!));
    }
    ).catchError((err)
    {
      print(err.toString());
      emit(AppChangeErrorShopFavoriteState(err.toString()));
    });
  }
  FoviertModle? fmodle;
  void FavoriteData()
  {
    emit(AppLodingShopFavorietyState());
    DioHalper.getdata(url: CHANGEFAVORIATE, token: token, lang: 'en').then((value) {
      fmodle = FoviertModle.formjson(value.data);
      emit(AppSecssuesShopFoveriteState());
    }
    ).catchError((err) {
      emit(AppErrorShopFavoriteState(err.toString()));
      print(err.toString());
    }
    );
  }
  void getSettinges()
  {
    AppLodingShopSettingesState();
    DioHalper.getdata(url:PROFILE,token: token).then((value)
    {
      updatemodle=LoginModle.fromjson(value.data);
      print(value.data);
      emit(AppSecssuesShopSettingesState());
    }
    ).catchError((err)
    {
      emit(AppLodingShopSettingesState());
      print(err.toString());
    });
  }

  LoginModle? updatemodle;
  void putUpdate({
    required String name,
    required String email,
    required String phone,
})
  {
    emit(AppLodingShopSettingesState());
    DioHalper.putdata(url: UPDATADATE,data:
        {
      'name':name,
      'email':email,
      'phone':phone,
    },token: token).then((value)
    {
      updatemodle=LoginModle.fromjson(value.data);
     emit(AppSecssuesShopUpdateState(updatemodle!));
     print(value.data);
    }).catchError((err)
    {
      emit(AppErrorShopUpdatesState(err.toString()));
      print(err.toString());
    }
    );
  }
}
