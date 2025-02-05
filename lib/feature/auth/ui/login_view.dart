import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/app_text_button.dart';
import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/feature/auth/ui/widgets/custom_text_buttom.dart';
import 'package:ecommerce_app/feature/auth/ui/widgets/dont_have_account.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
   bool isObscureText = true;


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
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
                       suffixIcon: Icon(Icons.email_outlined,size: 20.sp,),
                      
                      
                      ),
                      verticalSpace( 20),
                      AppTextFormField(
          
                    hintText: "Enter Your Password",
                     validator: (value){
                      if(value == null || value.isEmpty){
                         return "Please Enter Your password";
                      }
              
                      return null;
                      },
                      
                       labelText: "password",
                      
                      isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    // ignore: dead_code
                    isObscureText ? Icons.visibility_off : Icons.visibility,
                    size: 20.sp,
                  
                  )),
                      
                      
                      ),
                      verticalSpace( 20),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         CustomTextButtom(
                          backgroundColor: AppColors.kWhiteColor,
                          textButton: "Forgot Password ?",
                          textStyle: TextStyles.font16BlueSemiBold,
                          onTap: (){},
                          
                          
                          ),
                       ],
                     ),
                      verticalSpace( 20),
                      AppTextButton(
                        buttonText: "Login",
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
                              onPressed: (){},),
          
                            AppTextButton(
                              buttonWidth: 100.w,
                               buttonText: "Facebook",
                                                   
                             textStyle: TextStyles.font18WhiteSemiBold,
                             
                             //buttonHeight: 20.h,
                              onPressed: (){},),
          
                           ],
                         ),
          
                         verticalSpace(30),
                         DontHaveAccountText(),
                        
                              
          
          
                        
                        
                       
                  
                    ],
                  ),
                   ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}