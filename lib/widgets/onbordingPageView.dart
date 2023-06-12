import 'package:attendance/app/Resource/AppSize.dart';
import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/app/Resource/styles.dart';
import 'package:attendance/data/datasource/local/local.dart';
import 'package:attendance/presintation/onboarding/cubit/OnboardingStates.dart';
import 'package:attendance/presintation/onboarding/cubit/onboardingCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomPageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit,OnboardingStates>(
        builder: (context,state){
      return PageView.builder(
        onPageChanged: (val){
          OnboardingCubit.get(context).changecurrentpage(val);
        },
        itemCount: onboardingpages.length,
        itemBuilder: (context,index)=>
            LayoutBuilder(builder: (context,constrains){
              return Column(
                children: [
                  Container(
                      width: constrains.maxWidth,
                      color: Colors.grey,
                      child: Image.asset(onboardingpages[index].image,
                        fit: BoxFit.fill,
                        width: constrains.maxWidth,
                        height: constrains.maxHeight * 0.7,)),
                  SizedBox(height: constrains.maxHeight * 0.1,),
                  Container(
                    width: constrains.maxWidth * 0.8,
                    alignment: Alignment.center,
                    child: Text(onboardingpages[index].description,style:
                    getTextStyle(color: AppColors.gray,
                        fontSize: FontSize.s20,
                        fontweight: FontWeight.bold),),
                  ),
                ],
              );
            }),
      );
    });
  }
}
