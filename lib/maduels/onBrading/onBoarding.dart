

import 'package:flutter/material.dart';
import 'package:shop_sallh/maduels/Login/Loginshop.dart';
import 'package:shop_sallh/shared/components/components.dart';
import 'package:shop_sallh/shared/network/remoat/sharedpranfas.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBarding extends StatefulWidget {
  const onBarding({Key? key}) : super(key: key);

  @override
  State<onBarding> createState() => _onBardingState();
}

class _onBardingState extends State<onBarding> {
  List<OnBoarding> onboarding=
  [
  OnBoarding(image: "assates/shop4.jpg", Title1: "on Board 1 title", Title2: "on Board 1 title"),
    OnBoarding(image: "assates/shop1.png", Title1: "on Board 2 title", Title2: "on Board 2 title"),
    OnBoarding(image: "assates/shop2.png", Title1: "on Board 3 title", Title2: "on Board 3 title"),
  ];
  bool isonbarding=false;
  var pageview=PageController();
  late int crindex;
  void Submit(context)
  {
   CachHelper.savadate(key:'onBarding',value:isonbarding ).then((value){
     if(value)
       {
         navigatorandremove(wideget: LoginShop(),context: context);
       }
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [defualetTextButton(text: "Skipe",function: (){
          Submit(context);
        })],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageview,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => OnBoard(onboarding[index]),
                physics:BouncingScrollPhysics(),
                itemCount: onboarding.length,
                onPageChanged: (value) {
                  setState(() {
                    if(value==onboarding.length-1)
                    {
                      setState(() {
                        isonbarding=true;
                      });
                    }
                    else
                      {
                        setState(() {
                          isonbarding=false;
                        });
                      }
                  });

                },
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmoothPageIndicator(
                    controller: pageview,
                    count:  onboarding.length,
                    axisDirection: Axis.horizontal,
                    effect:  SlideEffect(
                        spacing:  10.0,
                        radius:  4.0,
                        dotWidth:  24.0,
                        dotHeight:  16.0,
                        paintStyle:  PaintingStyle.fill,
                        strokeWidth:  1.5,
                        dotColor:  Colors.grey,
                        activeDotColor:  Colors.blueAccent

                    ),


                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: ()
                    {
                      if(isonbarding)
                        {
                          Submit(context);
                        }else {
                        setState(() {
                          pageview.nextPage(
                              duration: Duration(milliseconds: 750),
                              curve: Curves.bounceOut);
                        });
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget OnBoard(OnBoarding onboarding)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: 500.0,
        height: 500.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0,),
        child: Image(image: AssetImage(onboarding.image),
        ),
      ),
      Text(onboarding.Title1,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: 30.0,
      )),
      Text(onboarding.Title2),

    ],
  );


}

class OnBoarding
{
  late String image;
  late String Title1;
  late String Title2;
  OnBoarding({required this.image,required this.Title1,required this.Title2});
}