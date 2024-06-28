

import 'package:shop_sallh/maduels/Login/Loginshop.dart';
import 'package:shop_sallh/shared/components/components.dart';
import 'package:shop_sallh/shared/network/remoat/sharedpranfas.dart';

 String? token;

 void sginout(context)
 {
   CachHelper.removedata(token: token!).then((value)
   {
     if(value)
     {
       navigatorandremove(wideget: LoginShop(), context: context);
     }
   });
 }