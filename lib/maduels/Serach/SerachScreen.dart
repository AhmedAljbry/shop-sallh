


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/Layot/ShopCubit/cubit.dart';
import 'package:shop_sallh/madle/Serachmodle/SerachModle.dart';
import 'package:shop_sallh/maduels/Serach/SerachCubit/Serachcubit.dart';
import 'package:shop_sallh/maduels/Serach/SerachCubit/serachstate.dart';
import 'package:shop_sallh/shared/components/components.dart';
import 'package:shop_sallh/shared/style/color.dart';

class SerachScreen extends StatelessWidget {
var fromkey=GlobalKey<FormState>();
var serachcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppSerachCubit, AppSerachState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
            appBar: AppBar(),
            body: Form(
              key: fromkey,
              child: Column(
                children: [
                  defuletTextFromefiled(
                    controller: serachcontroller,
                    icon: Icons.search_rounded,
                    lable: 'input serach',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'isEmpt Serach';
                      }
                      return null;
                    },
                    onChanged: (value)
                      {
                                AppSerachCubit()
                                    .get(context)
                                    .postserach(Serach: value);
                            }
                  ),
                  SizedBox(height: 10.0,),
                  if(state is AppLodingSerachState)
                    LinearProgressIndicator(),
                  SizedBox(height: 10.0,),
                  if(state is AppSecsseusSerachState)
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>SerachBuilder(AppSerachCubit().get(context).serachmodle!.data.data[index], context,isdiscount: false) ,
                        separatorBuilder:(context, index) =>Divider(),
                        itemCount:AppSerachCubit().get(context).serachmodle!.data.data.length),
                  )
                ],
              ),
            ),
        ),
      );
    },
);
  }
Widget SerachBuilder(SerachProductsModle modle,context, {bool isdiscount=true})=>Container(
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
              child: Image(image: NetworkImage(modle.image),

              ),
            ),
            if(modle.discount!=0 &&isdiscount)
              Container(color: Colors.red,child: Text('DISCOUNT',style: TextStyle(fontSize: 15.0,color: Colors.white))),
          ]
      ),
      Container(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              child: Text(modle.name,style: TextStyle(
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
                  Text(modle.price.toString(),style: TextStyle(color: defualetcolor,)),
                  SizedBox(width: 10.0,),
                  if(modle.discount!=0&&isdiscount)
                     Text(modle.old_price.toString(),style: TextStyle(color: Colors.grey[400],decoration: TextDecoration.lineThrough,fontSize: 15.0,),),
                  Spacer(),
                  IconButton(onPressed: ()
                  {
                    AppShopCubit().get(context).getchangefovrite(modle.id);
                  },
                      icon: CircleAvatar(child: Icon(Icons.favorite_outline,color: Colors.white,),
                    backgroundColor:( AppShopCubit().get(context).changefavorietmodle[modle.id]! && AppShopCubit().get(context).changefavorietmodle[modle.id] == true) ? Colors.redAccent:defualetcolor,)),
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
