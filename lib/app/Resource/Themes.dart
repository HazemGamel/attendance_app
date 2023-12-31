import 'package:attendance/app/Resource/AppSize.dart';
import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/app/Resource/styles.dart';
import 'package:flutter/material.dart';


class Themes{
 static ThemeData lightThemeMode = ThemeData.light().copyWith(
   textTheme: TextTheme(
     headline6: getTextStyle(color: AppColors.black,
         fontSize: FontSize.s17,fontweight: FontWeight.bold),
   ),
     appBarTheme: AppBarTheme(color: Colors.white)

 );
 static ThemeData darkThemeMode = ThemeData.dark().copyWith(
     textTheme: TextTheme(
       headline6: getTextStyle(color: AppColors.wight,
           fontSize: FontSize.s17,fontweight: FontWeight.bold),
     ),
   appBarTheme: AppBarTheme(color: Colors.grey)
 );
}