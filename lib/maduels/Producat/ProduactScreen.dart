

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/Layot/ShopCubit/cubit.dart';
import 'package:shop_sallh/Layot/ShopCubit/state.dart';
import 'package:shop_sallh/madle/Catagoriey/CatagorieyMadle.dart';
import 'package:shop_sallh/madle/HomeShop/Homemodle.dart';
import 'package:shop_sallh/shared/style/color.dart';

class ProduactScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppShopCubit, AppShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var medol=AppShopCubit().get(context);
       return ConditionalBuilder(

         condition: medol.homemodle != null && medol.categoriesmodle != null,
         builder:(context) =>Produact( medol.homemodle! , medol.categoriesmodle!,context),
         fallback: (context) => Center(child: CircularProgressIndicator()),
       );
      },
    );
  }
  Widget Produact (HomeModle? modle,CategoriesModle? cmodle,context,)
  {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options:CarouselOptions(
          height: 250,
        aspectRatio: 2/2,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
            items:modle!.data.banners.map((e) =>Image(image:NetworkImage(e.image),width: double.infinity),).toList(),

          ),
          SizedBox(height: 10.0,),
        Text("Catagrioy",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600,)),
          SizedBox(height: 10.0,),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8.0),
         child: Container(
           height: 120.0,
           width: double.infinity,
           child: ListView.builder(
             itemBuilder: (context, index) => CatagoiyBulder(cmodle!.data.data[index]),
              scrollDirection: Axis.horizontal,
             itemCount: cmodle!.data.data.length,
             physics: BouncingScrollPhysics(),
           ),
         ),
       ),
          SizedBox(height: 10.0,),
          Text("New Proudect",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600,)),
          SizedBox(height: 10.0,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             color: Colors.grey[300],
             child: GridView.count(
               crossAxisCount: 2,
               mainAxisSpacing: 1,
               crossAxisSpacing: 1,
               childAspectRatio: 1/1.60,
               children:List.generate(modle.data.products.length, (index) => GridBuldier(modle.data.products[index],context,)),
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               scrollDirection: Axis.vertical,

             ),
           ),
         )
             ],
           ),
    );
  }
  GridBuldier(ProductsModle modle,context)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
             children: [
               Container(
                width: double.infinity,
                height:200,
                child: Image(image: NetworkImage(modle.image),

                ),
              ),
               if(modle.discount!=0)
               Container(color: Colors.red,child: Text('DISCOUNT',style: TextStyle(fontSize: 15.0,color: Colors.white))),
        ]
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(modle.name,style: TextStyle(
                    fontSize: 14.0,
                    height: 1.0,

                  ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${modle.price.round()}',style: TextStyle(color: defualetcolor,fontSize: 15.0,)),
                      SizedBox(width: 10.0,),
                      if(modle.discount!=0)
                      Text('${modle.old_price.round()}',style: TextStyle(color: Colors.grey[400],decoration: TextDecoration.lineThrough,fontSize: 15.0,),),
                      Spacer(),
                      Container(
                        child: IconButton(onPressed: ()
                        {
                          AppShopCubit().get(context).getchangefovrite(modle.id);
                        }, icon: CircleAvatar(child: Icon(Icons.favorite_outline,color: Colors.white,),
                          backgroundColor: AppShopCubit().get(context).changefavorietmodle[modle.id]! ?Colors.redAccent:defualetcolor,)),
                      ),
                    ],
                  )
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
 Widget CatagoiyBulder(CData modle)=>  Padding(
   padding: const EdgeInsets.all(8.0),
   child: Container(
     height: 120.0,
     width:120.0,
     child:Stack(
       alignment: Alignment.bottomCenter,
       children: [
         Image(image: NetworkImage(modle.image),),
         Container(width: double.infinity,
             color: Colors.black.withOpacity(0.7),
             child: Text(modle.name,style: TextStyle(color: Colors.white,fontSize: 15.0,),textAlign: TextAlign.center,)),
       ],
     )
     ,),
 );
}
