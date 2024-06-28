


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/Layot/ShopCubit/cubit.dart';
import 'package:shop_sallh/Layot/ShopCubit/state.dart';
import 'package:shop_sallh/madle/Catagoriey/CatagorieyMadle.dart';

class CatagoriyScreen extends StatelessWidget {
  const CatagoriyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppShopCubit, AppShopState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
   var modle=AppShopCubit().get(context);
    return ConditionalBuilder(
      condition: modle.categoriesmodle != null ,
      builder:(context) =>ListView.separated(
          itemBuilder: (context, index) =>CatagioreyBulider(modle.categoriesmodle!.data.data[index]) ,
          separatorBuilder:(context, index) => Container(
            color: Colors.grey[400],
            height: 1.0,
            width: double.infinity,
          ),
          itemCount:modle.categoriesmodle!.data.data.length ),
      fallback: (context) => CircularProgressIndicator(),
    );
  },
);
  }
  CatagioreyBulider(CData modle)=> Row(
    children: [
      Container(
          width: 140.0,
          height: 140.0,
          child: Image(image: NetworkImage(modle.image),
          ),
      ),
      SizedBox(width: 10.0,),
      Text(modle.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.0)),
      Spacer(),
      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
    ],
  );
}
