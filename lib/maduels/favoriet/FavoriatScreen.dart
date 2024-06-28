
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/Layot/ShopCubit/cubit.dart';
import 'package:shop_sallh/Layot/ShopCubit/state.dart';
import 'package:shop_sallh/madle/Favoriet/GetFavoriet.dart';
import 'package:shop_sallh/shared/style/color.dart';


class FavoriatScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppShopCubit, AppShopState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ConditionalBuilder(
      condition:AppShopCubit().get(context).chfav !=null,
      builder:(context) =>Container(
        child: ListView.separated(
            itemBuilder: (context, index) =>FavorietBuilder(AppShopCubit().get(context).fmodle!.data.data[index],context),
            separatorBuilder: (context, index) => SizedBox(child: Divider()),
            itemCount: AppShopCubit().get(context).fmodle!.data.data.length),
      ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
  },
);
  }
  Widget FavorietBuilder(FData modle,context)=>Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: 120,
                height:120,
                child: Image(image: NetworkImage(modle.product.image),

                ),
              ),
              if(modle.product.discount!=0)
              Container(color: Colors.red,child: Text('DISCOUNT',style: TextStyle(fontSize: 15.0,color: Colors.white))),
            ]
        ),
        Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                child: Text(modle.product.name,style: TextStyle(
                ),
                ),
                width: 275.0,
                height: 70,
              ),
              Spacer(),
              Container(
                width: 275.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(modle.product.price.toString(),style: TextStyle(color: defualetcolor,)),
                    SizedBox(width: 10.0,),
                    if(modle.product.discount!=0)
                    Text(modle.product.old_price.toString(),style: TextStyle(color: Colors.grey[400],decoration: TextDecoration.lineThrough,fontSize: 15.0,),),
                    Spacer(),
                    IconButton(onPressed: ()
                    {
                      AppShopCubit().get(context).getchangefovrite(modle.product.id);
                    }, icon: CircleAvatar(child: Icon(Icons.favorite_outline,color: Colors.white,),
                      backgroundColor: AppShopCubit().get(context).changefavorietmodle[modle.product.id]! ? Colors.redAccent:defualetcolor,)),
                  ],
                ),
              )
            ],
          ),
        ),



      ],
    ),
  );
}
