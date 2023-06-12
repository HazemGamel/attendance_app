import 'package:attendance/app/Resource/AppSize.dart';
import 'package:attendance/app/Resource/AppStrings.dart';
import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/app/Resource/styles.dart';
import 'package:attendance/widgets/textformfieldcustom.dart';
import 'package:flutter/material.dart';

class CreateSubject extends StatelessWidget {
  TextEditingController subjectcontroller =TextEditingController();
  TextEditingController subjectcodecontroller =TextEditingController();
  final formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      appBar: AppBar(
        title: Text("createYourSubject"),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 0.0,
        backgroundColor: AppColors.splashBackgroundColor,
      ),
      body:  SafeArea(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0,left: 12,
                right: 12),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(AppStrings.creatsubject,style: getTextStyle(
                        color: AppColors.orange,
                        fontSize: FontSize.s30,
                        fontweight: FontWeight.bold),),
                  ),
                  SizedBox(height: AppSize.s30,),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: subjectcontroller,
                      validator:(value){
                        if(value!.isEmpty){
                          return "please enter your subjectName";
                        }
                        return null;
                      },
                      decoration:InputDecoration(
                        filled: true,
                        fillColor: AppColors.wight,
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blueGrey
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ) ,
                        hintText: "subjectName",
                        labelText: "Name",
                        labelStyle: TextStyle(
                            color: AppColors.orange
                        ),
                      )
                  ),
                  SizedBox(height: AppSize.s30,),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: subjectcodecontroller,
                      validator:(value){
                        if(value!.isEmpty){
                          return "please enter your subjectCode";
                        }
                        return null;
                      },
                      decoration:InputDecoration(
                        filled: true,
                        fillColor: AppColors.wight,
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blueGrey
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ) ,
                        hintText: "subjectCode",
                        labelText: "Code",
                        labelStyle: TextStyle(
                            color: AppColors.orange
                        ),
                      )
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
                        child: Text("Ok",style:
                        getTextStyle(color: AppColors.black,
                            fontSize: FontSize.s12,
                            fontweight: FontWeight.bold),),),



                   )
                ],
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
