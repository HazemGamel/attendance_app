

import 'package:attendance/app/constance/Appconstance.dart';
import 'package:attendance/app/di.dart';
import 'package:attendance/presintation/createsubject/createsubjectScreen.dart';
import 'package:attendance/presintation/home/cubit/Homecubit.dart';
import 'package:attendance/presintation/home/homeScreen.dart';
import 'package:attendance/presintation/joinSubject/joinSubjectScreen.dart';
import 'package:attendance/presintation/login/LoginScreen.dart';
import 'package:attendance/presintation/login/cubit/logincubit.dart';
import 'package:attendance/presintation/onboarding/cubit/onboardingCubit.dart';
import 'package:attendance/presintation/onboarding/onboardingScreen.dart';
import 'package:attendance/presintation/register/cubit/RegisterCubit.dart';
import 'package:attendance/presintation/register/registerScreen.dart';
import 'package:attendance/presintation/restpassword/checkemailScreen.dart';
import 'package:attendance/presintation/splash/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouters{
  Route? generateRouters(RouteSettings settings){
      switch(settings.name){
        case AppConstance.splashScreen:
          return MaterialPageRoute(builder: (_)=>SplashScreen());
        case AppConstance.onboardingScreen:
          return MaterialPageRoute(builder: (_)=>
              BlocProvider(
                  create: (context)=>OnboardingCubit()..setPref(),
              child: OnboardingScreen(),));
        case AppConstance.registerScreen:
          registerModule();
          return MaterialPageRoute(builder: (_)=>BlocProvider(
            create: (context)=>instance<RegisterCubit>(),
              child: RegisterScreen(),
          ));
        case AppConstance.loginScreen:
          loginModule();
          return MaterialPageRoute(builder: (_)=>BlocProvider
            (create: (context)=>instance<LoginCubit>(),
          child: LoginScreen(),),
          );
        case AppConstance.checkemialscreen:
          return MaterialPageRoute(builder: (_)=>CheckEmailScreen());
        case AppConstance.homeScreen:
          return MaterialPageRoute(builder: (_)=>
              BlocProvider(create: (context)=>HomeCubit(),
              child: HomeScreen(),));
        case AppConstance.createsubjectscreen:
          return MaterialPageRoute(builder: (_)=>CreateSubject());
        case AppConstance.joinsubjectscreen:
          return MaterialPageRoute(builder: (_)=>JoinSubjectScreen());
      }
  }
}