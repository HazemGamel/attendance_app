import 'package:attendance/app/Resource/AppSize.dart';
import 'package:attendance/app/Resource/AppStrings.dart';
import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/app/Resource/styles.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180.0)),
    color: AppColors.splashBackgroundColor,
    ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 30),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 2,
                    width: 40,
                    color: Colors.orange,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: (MediaQuery.of(context).size.height
                      - MediaQuery.of(context).padding.top) * 0.1,),
                      MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColors.wight,
          onPressed: (){
           Navigator.pushNamed(context, "/createsubjectscreen");
          },
          child: Text(AppStrings.creatsubject,style:
          getTextStyle(color: AppColors.black,
              fontSize: FontSize.s20,
              fontweight: FontWeight.bold),),),
                      SizedBox(height: (MediaQuery.of(context).size.height
                          - MediaQuery.of(context).padding.top) * 0.1,),
                      MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColors.wight,
          onPressed: (){
            Navigator.pushNamed(context, "/joinsubjectscreen");
          },
          child: Text(AppStrings.joinsubject,style:
          getTextStyle(color: AppColors.black,
              fontSize: FontSize.s20,
              fontweight: FontWeight.bold),),),
                      SizedBox(height: (MediaQuery.of(context).size.height
                          - MediaQuery.of(context).padding.top) * 0.1,),
                      MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColors.wight,
          onPressed: ()async{

          },
          child: Text(AppStrings.mysubject,style:
          getTextStyle(color: AppColors.black,
              fontSize: FontSize.s20,
              fontweight: FontWeight.bold),),),
                  SizedBox(height: (MediaQuery.of(context).size.height
                      - MediaQuery.of(context).padding.top) * 0.3,),
                ],
              ),
            ],
          ),
        ),
    ),
    );
  }
}
