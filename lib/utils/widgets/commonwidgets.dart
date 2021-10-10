import 'package:flutter/material.dart';

Widget customRadiusButton(
    BuildContext context,
    Function()? press,
    String? btnText,
    bool? isFullWidth,
    double? width,
    double? height,
    double? radius,
    Color? color1,
    Color? color2,
    TextStyle? btnTextStyle) {
  return GestureDetector(
    onTap: press,
    child: Container(
      width: isFullWidth! ? MediaQuery.of(context).size.width : width,
      height: height != 0 ? height : 45,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [color1!, color2!])),
      child: Text(
        btnText!,
        style: btnTextStyle!,
      ),
    ),
  );
}
