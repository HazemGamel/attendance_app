import 'package:attendance/app/Resource/AppSize.dart';
import 'package:attendance/app/Resource/AppStrings.dart';
import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/app/Resource/styles.dart';
import 'package:attendance/app/constance/Appconstance.dart';
import 'package:attendance/presintation/register/cubit/RegisterCubit.dart';
import 'package:attendance/presintation/register/cubit/RegisterStates.dart';
import 'package:attendance/widgets/textformfieldcustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {

  TextEditingController namecontroller =TextEditingController();
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  TextEditingController confirmpassswordcontroller =TextEditingController();

  final formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180.0)),
            color: AppColors.splashBackgroundColor,
          ),
          child: SafeArea(
                child: Form(
                  key: formkey,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 30.0,left: 12,
                          right: 12),
                      child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: 2,
                                  width: 40,
                                  color: Colors.orange,
                                ),
                              ),
                              SizedBox(height: 20,),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(AppStrings.Register,style: getTextStyle(
                                    color: AppColors.wight,
                                    fontSize: FontSize.s30,
                                    fontweight: FontWeight.bold),),
                              ),
                              SizedBox(height: AppSize.s30,),
                              TextFormFieldCustom(namecontroller,
                                      (v){
                                    if(v!.isEmpty){
                                      return "please enter your name";
                                    }
                                    return null;
                                  },
                                  AppStrings.enterusername,
                                  AppStrings.username,
                                  TextInputType.name,
                                  Icons.person
                              ),
                              TextFormFieldCustom(emailcontroller,
                                      (v){
                                    if(v!.isEmpty || !v.contains("@")){
                                      return "please enter your valid email";
                                    }
                                    return null;
                                  },
                                  AppStrings.enteremail,
                                  AppStrings.email,
                                  TextInputType.emailAddress,
                                  Icons.email
                              ),
                              TextFormFieldCustom(passwordcontroller,
                                      (v){
                                    if(v!.isEmpty){
                                      return "please enter your password";
                                    }else if(v.length<6){
                                      return "your password must be greater than 6 ";
                                    }
                                    return null;
                                  },
                                  AppStrings.enterpassword,
                                  AppStrings.password,
                                  TextInputType.name,
                                  Icons.visibility
                              ),
                             BlocBuilder<RegisterCubit,RegisterStates>
                               (builder: (context,state){
                               if(state is RegisterLoadingState){
                                 return Center(child: CircularProgressIndicator());
                               }
                                 return  Padding(
                                   padding: const EdgeInsets.only(top: 20),
                                   child:MaterialButton(
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                     color: AppColors.wight,
                                     onPressed: ()async{
                                       if(formkey.currentState!.validate()){
                                        RegisterCubit.get(context)
                                            .Register(namecontroller.text,
                                            emailcontroller.text,
                                            passwordcontroller.text, context);
                                       }
                                       FocusScope.of(context).unfocus();
                                     },
                                     child: Text(AppStrings.register,style:
                                     getTextStyle(color: AppColors.black,
                                         fontSize: FontSize.s12,
                                         fontweight: FontWeight.bold),),),

                                 );
                             }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(AppStrings.haveaccount,style: getTextStyle(
                                      color: AppColors.wight,
                                      fontSize: FontSize.s20,
                                      fontweight: FontWeight.bold),),
                                  TextButton(onPressed: (){
                                   Navigator.pushReplacementNamed(context, AppConstance.loginScreen);
                                  },
                                      child: Text(AppStrings.login,
                                        style: getTextStyle(
                                            color: AppColors.orange,
                                            fontSize: FontSize.s20),))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
              ),
        ),

      );

  }
}
