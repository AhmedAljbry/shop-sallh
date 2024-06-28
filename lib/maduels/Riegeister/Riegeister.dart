


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/Layot/HomeShop.dart';
import 'package:shop_sallh/maduels/Riegeister/Cubit/RiegiesterCubit.dart';
import 'package:shop_sallh/maduels/Riegeister/Cubit/RiegiesterState.dart';
import 'package:shop_sallh/shared/components/components.dart';
import 'package:shop_sallh/shared/components/constanet.dart';
import 'package:shop_sallh/shared/network/remoat/sharedpranfas.dart';

class Riegeister extends StatelessWidget {
  var formcontroller = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool ispassword=true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => RiegiesterCubit(),
  child: BlocConsumer<RiegiesterCubit, RiegiesterState>(
  listener: (context, state) {
   if(state is RiegiesterSecssesState)
     {
       if(state.login.status)
         {
          CachHelper.savadate(key: 'token', value: state.login.data?.token).then((value)
          {
           if(value)
             {
               token=state.login.data!.token;
               navigatorandremove(wideget: HomeShop(), context: context);
               showtoset(message: state.login.message, state: TostSate.SECCSES);
             }
          });
         }
       else
         {

           showtoset(message: state.login.message, state: TostSate.ERROR);
         }
     }
  },
  builder: (context, state) {
   var riegiester=RiegiesterCubit().get(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formcontroller,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Riegiester", style: TextStyle(
                      fontSize: 50.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 10.0,),
                  Text("Create Riegiester",
                      style: TextStyle(fontSize: 30.0, color: Colors.grey)),
                  SizedBox(height: 10.0,),
                  defuletTextFromefiled(
                      controller: namecontroller,
                      keyboardType: TextInputType.name,
                      icon: Icons.person_remove_sharp,
                      lable: "input name",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "name is empty";
                        }
                        return null;
                      },
                      onFieldSubmitte: (value) {
                        if (value.isEmpty) {
                          return "name is empty";
                        }
                        return null;
                      }
                  ),

                  SizedBox(height: 10.0,),
                  defuletTextFromefiled(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      lable: "input email",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "email is empty";
                        }
                        return null;
                      },
                      onFieldSubmitte: (value) {
                        if (value.isEmpty) {
                          return "email is empty";
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 10.0,),
                  defuletTextFromefiled(
                      controller: passwordcontroller,
                      icon: Icons.lock_outline,
                      suffixIcon:riegiester.ispassword ? Icons.remove_red_eye_outlined :Icons.visibility_off_outlined,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText:riegiester.ispassword,
                      onsuffix: () {
                        riegiester.IsPassword();
                      },
                      lable: "input password",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "password is empty";
                        }
                        return null;
                      },
                      onFieldSubmitte: (value) {

                      }
                  ),
                  SizedBox(height: 10.0,),
                  defuletTextFromefiled(
                      controller: phonecontroller,
                      keyboardType: TextInputType.phone,
                      icon: Icons.phone_android_outlined,
                      lable: "input phone",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "phone is empty";
                        }
                        return null;
                      },
                      onFieldSubmitte: (value) {
                        if (value.isEmpty) {
                          return "phone is empty";
                        }
                        return null;
                      }
                  ),

                  SizedBox(height: 10.0,),
                  ConditionalBuilder(
                    condition: state is! RiegiesterLodingState,
                    builder:(context) => deufaletMatrealButton(
                      txt: 'Register',
                        icon: Icons.how_to_reg,
                        onPressed: () {
                          /* navigatorandremove(
                                      wideget: HomeShop(), context: context);
                                }*/
                          if(formcontroller.currentState!.validate())
                          riegiester.createRigester(
                            name: namecontroller.text,
                              email: emailcontroller.text,
                            password: passwordcontroller.text,
                              phone: phonecontroller.text,
                          );

                        }),
                    fallback:(context) => Center(child: CircularProgressIndicator()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont't hava an acounet"),
                      defualetTextButton(text: "Register", function: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Riegeister(),));
                      })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}
