



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/Layot/ShopCubit/cubit.dart';
import 'package:shop_sallh/Layot/ShopCubit/state.dart';
import 'package:shop_sallh/maduels/Serach/SerachScreen.dart';
import 'package:shop_sallh/shared/components/components.dart';
import 'package:shop_sallh/shared/components/constanet.dart';
import 'package:shop_sallh/shared/network/remoat/sharedpranfas.dart';

class HomeShop extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppShopCubit, AppShopState>(
      listener: (context, state)
      {

      },
      builder: (context, state) {
        var screen = AppShopCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Sallah', style: Theme
                .of(context)
                .textTheme
                .bodyLarge!
                .copyWith(
              fontSize: 40.0,
            ),),
            actions: [
              IconButton(onPressed: () {
                naviagtorpush(context: context,widget: SerachScreen());
              }, icon: Icon(Icons.search_rounded)),
              IconButton(onPressed: ()
                  {
                    CachHelper.savadate(key: 'token', value:screen.updatemodle!.data!.token).then((value){
                      sginout(context);
                    });

                  }
                  , icon: Icon(Icons.login_outlined)),
            ],
          ),
          body: screen.screen[screen.creentscreen],
          bottomNavigationBar: BottomNavigationBar(
            items: screen.bottomnavigationbarItem,
            currentIndex: screen.creentscreen,
            onTap: (int value) {
              screen.changebottomnavigationbaritem(value);
            },
          ),
        );
      },
    );
  }
}

