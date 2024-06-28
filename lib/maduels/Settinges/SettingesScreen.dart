


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sallh/Layot/ShopCubit/cubit.dart';
import 'package:shop_sallh/Layot/ShopCubit/state.dart';
import 'package:shop_sallh/shared/components/components.dart';

class SettingScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phoncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppShopCubit, AppShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state)
      {
        var modle=AppShopCubit().get(context);
        namecontroller.text=modle.updatemodle!.data!.name;
        emailcontroller.text=modle.updatemodle!.data!.email;
        phoncontroller.text= modle.updatemodle!.data!.phone;
        return ConditionalBuilder(
          condition:modle.updatemodle!=null,
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  key: formkey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Updata data", style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      )),
                      SizedBox(height: 15.0,),
                      if(state is AppLodingShopUpdateState)
                      Container(width:30.0,height: 20.0,child: LinearProgressIndicator()),
                      SizedBox(height: 15.0,),
                      defuletTextFromefiled(
                        controller: namecontroller,
                        icon: Icons.person,
                        lable: 'input name',
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'isEmpty name';
                          }
                          return null;
                        }
                      ),
                      SizedBox(height: 15.0,),
                      defuletTextFromefiled(
                        controller: emailcontroller,
                        icon: Icons.email_outlined,
                        lable: 'input email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'isEmptemail';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0,),
                      defuletTextFromefiled(
                        controller: phoncontroller,
                        icon: Icons.phone_android_rounded,
                        lable: 'input phone',
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'isEmpty phone';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.0,),
                      deufaletMatrealButton(
                          icon: Icons.update, txt: 'UpdataData', onPressed: ()
                      {
                        if(formkey.currentState!.validate())
                        {
                          modle.putUpdate(
                              name: namecontroller.text,
                              email: emailcontroller.text,
                              phone: phoncontroller.text,
                        );
                      }
                      }
                      ),
                      SizedBox(height: 15.0,),
                      deufaletMatrealButton(icon: Icons.login_outlined,
                          txt: 'Logout',
                          onPressed: ()
                          {

                          },
                          color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }, fallback:(context) =>Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }
}
