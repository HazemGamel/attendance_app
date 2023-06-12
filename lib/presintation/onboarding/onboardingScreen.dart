
import 'package:attendance/app/Resource/AppSize.dart';
import 'package:attendance/app/Resource/AppStrings.dart';
import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/app/Resource/styles.dart';
import 'package:attendance/app/constance/Appconstance.dart';
import 'package:attendance/data/datasource/local/local.dart';
import 'package:attendance/presintation/onboarding/cubit/OnboardingStates.dart';
import 'package:attendance/presintation/onboarding/cubit/onboardingCubit.dart';
import 'package:attendance/widgets/onbordingPageView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height
                  - MediaQuery.of(context).padding.top) * 0.7,
              child: CustomPageView(),
            ),
            Container(
              height: (MediaQuery.of(context).size.height
                  - MediaQuery.of(context).padding.top) * 0.3,
              child: Column(
                children: [
                      BlocBuilder<OnboardingCubit,OnboardingStates>(builder: (context,state){
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(onboardingpages.length,
                                      (index)=>
                                      AnimatedContainer(
                                        margin: const EdgeInsets.only(right: 20,top: 20),
                                        duration: const Duration(milliseconds: 400),
                                        height: AppSize.s10,
                                        width: AppSize.s12,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color:OnboardingCubit.get(context).currentpage
                                                == index? AppColors.switchcolor:
                                            AppColors.gray
                                        ),
                                      )),
                            ],
                          ),
                        );
                      }),
                                Padding(
                    padding: const EdgeInsets.only(top: 20),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: AppColors.black,
                        onPressed: (){
                       Navigator.pushReplacementNamed(context, AppConstance.registerScreen);
                        },
                        child: Text(AppStrings.skip,style:
                        getTextStyle(color: AppColors.wight,
                            fontSize: FontSize.s12,
                            fontweight: FontWeight.bold),),),

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
