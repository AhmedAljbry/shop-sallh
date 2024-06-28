import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defuletTextFromefiled({
 required var controller,
  required String lable,
  required IconData icon,
  onChanged,
  onFieldSubmitte,
   required  validator,

   IconData? suffixIcon,
  onsuffix,
  bool obscureText=false,
  required TextInputType keyboardType,
  bool isClickable = true,

})=> TextFormField(
  controller:controller,
  keyboardType: TextInputType.text,
  obscureText: obscureText,
  enabled:isClickable,
  decoration: InputDecoration(
    label: Text(lable),
    prefixIcon: Icon(icon),

    suffixIcon: IconButton(onPressed: onsuffix, icon: Icon(suffixIcon)),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(style: BorderStyle.solid,color: Colors.blueAccent,strokeAlign: 20),
      gapPadding: 10,
    ),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blueAccent,strokeAlign: 20.0,style: BorderStyle.solid)),
  ),
  onChanged: onChanged,
  onFieldSubmitted: onFieldSubmitte,
  validator: validator,
);
defualetTextButton({
  required String text,
  required function
})=>
    TextButton( child:Text(text),onPressed: function,);
deufaletMatrealButton({
   double width=double.infinity,
   double height=50.0,
  Color color= Colors.blueAccent,
  required IconData icon,
  required String txt,
  required onPressed,

})=> Container(
  width: double.infinity,
  height: 50.0,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(30.0),
    border:Border.all(color: Colors.white,style: BorderStyle.solid,strokeAlign: -1,),
  ),
  child: MaterialButton(
    onPressed: onPressed,child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon,color: Colors.white),
      Text(txt,style: TextStyle(color: Colors.white)),
    ],
  ),
  ),
);
void navigatorandremove({
  required Widget wideget,
  required context,
  bool route1=false,
})=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => wideget,), (route) => route1);
void naviagtorpush({required context,required Widget widget})=> Navigator.push(context, MaterialPageRoute(builder: (context) => widget,));
enum TostSate{SECCSES,ERROR,Warning}

Color chaesColors(TostSate to)
{
  Color color;
  switch(to)
  {
    case TostSate.SECCSES:color=Colors.green;
    break;
    case TostSate.ERROR:color=Colors.redAccent;
    break;
    case TostSate.Warning:color=Colors.yellowAccent;
    break;
  }
  return color;
}
void showtoset({
  required String message,
  required TostSate state
})=> Fluttertoast.showToast(
    msg: "This is Center Short Toast",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor:chaesColors(state),
    textColor: Colors.white,
    fontSize: 16.0);