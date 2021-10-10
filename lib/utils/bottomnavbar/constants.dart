import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor customMaterialAppColor = MaterialColor(0xFF5936CC, color);

class Constants {
  //colors
  static const AppPrimaryColor = Color(0xFF5936CC);
  static const AppDarkBlueColor = Color(0xFF1F2360);
  static const AppYellowColor = Color(0xFFFFBF3D);
  static const AppLightGrey = Color(0xFFE7E7E7);
  static const AppLightBlueColor = Color(0xFFE4EBF6);
  static const AppLightButtonBackground = Color(0xFFE4EBF6);
  static const blackColor = Colors.black;
  static const greyColor = Colors.grey;
  static final Color lightGrey = Color(0xFFF3F6FF);
  static const ApplightOrange = Color(0xFFF7805A);
  static const blueColor = Colors.blue;
  static const whiteColor = Colors.white;
  static const transparentAppColor = Colors.black12;
  static const transparentColor = Colors.transparent;
  //orange
  static const darkOrange = Color(0xFFee6002);
  static const lightOrange = Color(0xFFF7805A);
  //Green
  static final Color lightGreen = Color(0xFFE1F5EC);
  static final Color green = Color(0xFFB8DBCB);
  static final Color paidGreen = Color(0xFF65CF66);
  static final Color receivedGreen = Color(0xFF54CD54);
  static final Color darkGreen = Color(0xFF04D361);

  //Red
  static final Color lightRed = Color(0xFFF5E9EC);
  static final Color red = Color(0xFFE5C5CF);
  static final Color darkRed = Color(0xFFCC3750);

  static final ButtonStyle detailButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 30),
    padding: EdgeInsets.symmetric(horizontal: 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );
}
