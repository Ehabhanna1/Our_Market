import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/app_text_button.dart';
import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/feature/auth/ui/widgets/custom_elevation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.kScaffoldColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         
          children: [
 
              Text("Reset Password",
              textAlign: TextAlign.center,
              style: TextStyles.font24BlackBold,
              
              
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
                      verticalSpace(30),
                      AppTextButton(
                        buttonText: "Submit",
                         textStyle: TextStyles.font18WhiteSemiBold,
                          onPressed: (){},),
                          verticalSpace(20),

           ], ),
                  ),
                ),
              
          ],    


      ),),
    );
  }
}