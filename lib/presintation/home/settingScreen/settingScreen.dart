import 'package:attendance/app/Resource/AppSize.dart';
import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/app/Resource/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.settingcolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 5,right: 5),
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: (MediaQuery.of(context).size.height
                      - MediaQuery.of(context).padding.top) * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person_pin_outlined,size: 40,color: AppColors.gray,),
                      Container(
                        width: 300,
                        height: (MediaQuery.of(context).size.height
                            - MediaQuery.of(context).padding.top) * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hazem Jamel Mahmoud ",maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: getTextStyle(color: AppColors.black,
                                  fontSize: FontSize.s20,fontweight: FontWeight.bold),),
                            Text("hazemhhh@gmail.com"
                                ,maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              style: getTextStyle(color: AppColors.black,
                                  fontSize: FontSize.s20,fontweight: FontWeight.bold),),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: (MediaQuery.of(context).size.height
                    - MediaQuery.of(context).padding.top) * 0.01,),
                Row(
                  children: [
                    Icon(Icons.home,size: 50,color: AppColors.gray,),
                    SizedBox(width: 20,),
                    Text("Home",
                      style: getTextStyle(color: AppColors.black,
                          fontSize: FontSize.s25,fontweight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: (MediaQuery.of(context).size.height
                    - MediaQuery.of(context).padding.top) * 0.04,),
                Row(
                  children: [
                    Icon(Icons.settings,size: 50,color: AppColors.gray,),
                    SizedBox(width: 20,),
                    Text("Setting && Privacy",
                      style: getTextStyle(color: AppColors.black,
                          fontSize: FontSize.s25,fontweight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: (MediaQuery.of(context).size.height
                    - MediaQuery.of(context).padding.top) * 0.04,),
                Row(
                  children: [
                    Icon(Icons.feedback,size: 50,color: AppColors.gray,),
                    SizedBox(width: 20,),
                    Text("Help && Feedback",
                      style: getTextStyle(color: AppColors.black,
                          fontSize: FontSize.s25,fontweight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: (MediaQuery.of(context).size.height
                    - MediaQuery.of(context).padding.top) * 0.04,),
                Row(
                  children: [
                    Icon(Icons.notifications,size: 50,color: AppColors.gray,),
                    SizedBox(width: 20,),
                    Text("Notifications",
                      style: getTextStyle(color: AppColors.black,
                          fontSize: FontSize.s25,fontweight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: (MediaQuery.of(context).size.height
                    - MediaQuery.of(context).padding.top) * 0.04,),
                Row(
                  children: [
                    Icon(Icons.logout,size: 50,color: AppColors.gray,),
                    SizedBox(width: 20,),
                    Text("LogOut",
                      style: getTextStyle(color: AppColors.black,
                          fontSize: FontSize.s25,fontweight: FontWeight.bold),),
                  ],
                ),
              ],
            )),
      )
    );
  }
}