import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';


ThemeData thmeligth=ThemeData(
appBarTheme: AppBarTheme(
backgroundColor: Colors.white,
elevation: 0.0,
iconTheme: IconThemeData(
  color: defualetcolor,
),
systemOverlayStyle: SystemUiOverlayStyle(
statusBarColor: Colors.grey,
systemNavigationBarColor: Colors.grey,
statusBarBrightness: Brightness.light,
systemNavigationBarIconBrightness: Brightness.light,
statusBarIconBrightness: Brightness.light,
),
actionsIconTheme: IconThemeData(
color: Colors.black,
)
),

scaffoldBackgroundColor: Colors.white,
floatingActionButtonTheme: FloatingActionButtonThemeData(
backgroundColor: defualetcolor,
),
    textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 90.0,
      fontWeight: FontWeight.w600,
    ),
  ),
primaryColor:defualetcolor,
bottomNavigationBarTheme: BottomNavigationBarThemeData(

  backgroundColor: Colors.grey[400],
  elevation: 10.0,
  unselectedItemColor: defualetcolor,
  selectedItemColor: defualetcolor,
  unselectedIconTheme: IconThemeData(
    color: defualetcolor,
    fill: 0.9,
    grade: 0.9,

  ),
  selectedIconTheme: IconThemeData(
    color: Colors.deepOrange,
  ),
  mouseCursor: MaterialStateMouseCursor.clickable,
  landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
selectedLabelStyle:TextStyle(color: Colors.deepOrange),
  enableFeedback: true,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  unselectedLabelStyle: TextStyle(color: defualetcolor),

)
);