

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/Layot/HomeShop.dart';
import 'package:shop_sallh/maduels/Login/Cubit/Logincubit.dart';
import 'package:shop_sallh/maduels/Login/Cubit/Loginstate.dart';
import 'package:shop_sallh/maduels/Riegeister/Riegeister.dart';
import 'package:shop_sallh/shared/components/components.dart';
import 'package:shop_sallh/shared/components/constanet.dart';
import 'package:shop_sallh/shared/network/remoat/sharedpranfas.dart';

class LoginShop extends StatelessWidget {
  var formcontroller = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
 bool ispassword=true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppShopLoginCubit(),
      child: BlocConsumer<AppShopLoginCubit, LoginShopState>(
        listener: (context, state) {
         if(state is AppSecssuesShopLoginState)
           {
                  if(state.login.status) {

                    showtoset(message: state.login.message, state: TostSate.SECCSES);
                    CachHelper.savadate(key: 'token', value:state.login.data!.token ).then((value)
                    {
                      print(state.login.message);
                      token=state.login.data!.token;
                      navigatorandremove(wideget: HomeShop(), context: context);
                    }
                    );
                  }
                  else
                    {
                      showtoset(message: state.login.message, state: TostSate.ERROR);
                    }

          }
        },
        builder: (context, state) {
       var login= AppShopLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formcontroller,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Login", style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w600)),
                        SizedBox(height: 10.0,),
                        Text("account new Sigin ",
                            style: TextStyle(fontSize: 30.0, color: Colors.grey)),
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
                            suffixIcon:login.ispassword ? Icons.remove_red_eye_outlined :Icons.visibility_off_outlined,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:login.ispassword,
                            onsuffix: () {
                              login.IsPassword();
                            },
                            lable: "input password",
                            validator: (value) {
                              if (value.isEmpty) {
                                return "password is empty";
                              }
                              return null;
                            },
                            onFieldSubmitte: (value) {
                              if (formcontroller.currentState!.validate()) {
                                login.postlogindata(email: emailcontroller.text,
                                  password: passwordcontroller.text,);
                                navigatorandremove(
                                    wideget: HomeShop(), context: context);
                              }
                            }
                        ),
                        SizedBox(height: 10.0,),
                        ConditionalBuilder(
                          condition: state is! AppLodingShopLoginState,
                          builder:(context) => deufaletMatrealButton(
                              icon: Icons.login_outlined,
                              txt: 'Sigin',
                              onPressed: () {
                                if (formcontroller.currentState!.validate()) {
                                  login.postlogindata(email: emailcontroller.text,
                                    password: passwordcontroller.text,);

                                  /* navigatorandremove(
                                      wideget: HomeShop(), context: context);
                                }*/
                                }    }
                          ),
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

