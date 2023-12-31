import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  TextEditingController controller;
  final String hint;
  final String label;
  final bool obscure ;
  final String? Function(String?)? function;
  TextInputType textInputType;
  final IconData iconData;
  TextFormFieldCustom(
     this.controller,
      this.function,
      this.hint,
     this.label,
     this.textInputType,
      this.iconData,
{ this.obscure = false});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            keyboardType: textInputType,
            controller: controller,
            validator:(value)=>function!(value),
            obscureText: obscure,
            decoration:InputDecoration(
              filled: true,
              fillColor: AppColors.wight,
              suffixIcon: Icon(iconData,color: AppColors.black,),
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
                hintText: hint,
                labelText: label,
                labelStyle: TextStyle(
                    color: AppColors.orange
                ),
            )
        ),
    );
  }
}


