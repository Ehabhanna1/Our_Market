import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(25),
            Text("Welocome To Our Market",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,),
            
            
            ),
            
            verticalSpace(50),
            Card(
              margin: EdgeInsets.all(24.h),
              color: AppColors.kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(17),

                ),
              

              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                 AppTextFormField(
                  hintText: "Enter Your Email",
                   validator: (value){
                    if(value == null || value.isEmpty){
                       return "Please Enter Your Email";
                    }
            
                    return null;
                    },
                    
                     labelText: "Email",
                     suffixIcon: Icon(Icons.email_outlined),
                    
                    
                    ),
                    verticalSpace( 20),
                    AppTextFormField(
                  hintText: "Enter Your Email",
                   validator: (value){
                    if(value == null || value.isEmpty){
                       return "Please Enter Your password";
                    }
            
                    return null;
                    },
                    
                     labelText: "password",
                     suffixIcon: IconButton(
                       onPressed: (){},
                       icon: Icon(Icons.visibility_off_outlined),
                     ),
                    
                    
                    ),
                
                ]
                ),
              ),
            ),
          ],
        ),
        ),
    );
  }
}