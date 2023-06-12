
import 'dart:async';

import 'package:attendance/app/Resource/AppSize.dart';
import 'package:attendance/app/Resource/AppStrings.dart';
import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/app/Resource/styles.dart';
import 'package:attendance/app/constance/Appconstance.dart';
import 'package:attendance/app/di.dart';
import 'package:attendance/app/networkInfo/AppPref.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    Timer? _timer;
    final AppPreferences _appPreferences = instance<AppPreferences>();

  void delay(){
    _timer= Timer(const Duration(seconds: 5),
            ()=>goTo());
  }
  void goTo(){
    if(_appPreferences.sharedPreferences.getBool("onboarding")==true){
       if(_appPreferences.sharedPreferences.getString("token") != null){
         Navigator.pushReplacementNamed(context, AppConstance.homeScreen);

       }else{
         Navigator.pushReplacementNamed(context, AppConstance.registerScreen);

       }
    }else{
      Navigator.pushReplacementNamed(context, AppConstance.onboardingScreen);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context,constrains){
            return Padding(
              padding:  EdgeInsets.
              only(bottom: constrains.maxHeight * 0.1),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constrains.maxWidth * 0.012,
                      height: constrains.maxHeight * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius
                            .only(bottomLeft: Radius.circular(5),topRight: Radius.circular(5)) ,

                      ),
                    ),
                    SizedBox(width: constrains.maxWidth * 0.03,),
                    Container(
                      width: 5,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius
                            .only(bottomLeft: Radius.circular(5),topRight: Radius.circular(5)) ,

                      ),
                    ),
                    SizedBox(width: constrains.maxWidth * 0.03,),
                    Container(
                      width: 5,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius
                            .only(bottomLeft: Radius.circular(5),topRight: Radius.circular(5)) ,

                      ),
                    ),
                    SizedBox(width: constrains.maxWidth * 0.05,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.splashSmart,style
                            :getTextStyle(
                            color: AppColors.wight,
                            fontSize: FontSize.s30,
                        fontweight: FontWeight.bold),),

                        Text(AppStrings.splashAttendance,
                          style:getTextStyle(color: AppColors.wight,
                              fontSize: FontSize.s30,fontweight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


