import 'package:ecommerce_app/core/functions/navigation.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/app_text_button.dart';
import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';

import 'package:ecommerce_app/feature/auth/ui/login_view.dart';
import 'package:ecommerce_app/feature/auth/ui/widgets/custom_text_button.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               Text(
                     "Welcome To Our Market",
                   style: TextStyles.font24BlackBold,
                            
                  ),
                  verticalSpace(20),
                   Card(
                            color: AppColors.kWhiteColor,
                            margin: const EdgeInsets.all(24),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  AppTextFormField(
                                    hintText: 'Enter Your Name',
                                     validator: (value) {
                                       
                                     },
                                      labelText: 'Name',
                                      suffixIcon: Icon(Icons.person_2_outlined),
                                      
                                      ),
                                  verticalSpace(20),
                                  AppTextFormField(
                                    hintText: 'Enter Your Email',
                                     validator: (value) {
                                       
                                     },
                                      labelText: 'Email',
                                      suffixIcon: Icon(Icons.email_outlined),
                                      
                                      ),
                                  verticalSpace(20),
                                  AppTextFormField(
                                    hintText: 'Enter Password',
                                     validator: (value) { 
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                     },
                                      labelText: 'Password',
                                      suffixIcon: Icon(Icons.visibility_off),
                                    
                                  
                                    
                                  ),
                                 
          
           verticalSpace( 20),
                        AppTextButton(
                          buttonText: "Sign Up",
                           textStyle: TextStyles.font18WhiteSemiBold,
                           //buttonHeight: 20.h,
                            onPressed: (){},),
                            verticalSpace( 20),
                            Text("OR Login With",
                            style: TextStyles.font15DarkBlueMedium,
                              
                            ),
                            verticalSpace( 20),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               AppTextButton(
                                buttonWidth: 100.w,
                                
                                 buttonText: "Google",
                                                     
                               textStyle: TextStyles.font18WhiteSemiBold,
                               //buttonHeight: 20.h,
                                onPressed: (){}, ),
            
                              AppTextButton(
                                buttonWidth: 100.w,
                                 buttonText: "Facebook",
                                                     
                               textStyle: TextStyles.font18WhiteSemiBold,
                               
                               //buttonHeight: 20.h,
                                onPressed: (){}, ),
            
                             ],
                           ),
            
                           verticalSpace(30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? ",
                              style: TextStyles.font15DarkBlueMedium,),
                              CustomTextButton(
                                textButton: "Login",
                                 onTap: (){
                                  Navigator.pop(context);
                                },),
                            ])
          
                              
             ], ), 
           ),
           ),
            ],
          ),
        ),
     ), );
  }
}