import 'package:attendance/app/Resource/AppSize.dart';
import 'package:attendance/app/Resource/AppStrings.dart';
import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/app/Resource/styles.dart';
import 'package:attendance/widgets/textformfieldcustom.dart';
import 'package:flutter/material.dart';

class CheckEmailScreen extends StatelessWidget {

  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();

  final formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.splashBackgroundColor,
        elevation: 0.0,
        leading: IconButton(icon:
        const Icon(Icons.arrow_back_ios,color: AppColors.wight,)
          ,onPressed: (){
          Navigator.pop(context);
          },),
      ),
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
                      child: Text(AppStrings.forgetpassword,style: getTextStyle(
                          color: AppColors.switchcolor,
                          fontSize: FontSize.s30,
                          fontweight: FontWeight.bold),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      child: Text(AppStrings.pleasecheckyouremail,
                        style: getTextStyle(color: AppColors.gray,
                            fontSize: FontSize.s20,fontweight: FontWeight.bold),),
                    ),
                    SizedBox(height: AppSize.s30,),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child:MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: AppColors.wight,
                        onPressed: ()async{
                          if(formkey.currentState!.validate()){

                          }
                          FocusScope.of(context).unfocus();
                        },
                        child: Text(AppStrings.checkCode,style:
                        getTextStyle(color: AppColors.black,
                            fontSize: FontSize.s12,
                            fontweight: FontWeight.bold),),),

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
