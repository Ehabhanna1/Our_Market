import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Card(
          color: AppColors.kWhiteColor,
          child: Padding(
            padding:EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60.r,
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  child: Icon(
                    Icons.person,
                    size: 45.r,
                  ),
                  
                ),
                verticalSpace(10),
                Text(
                  "user name",
                  style: TextStyles.font18BlackBold,
                ),
                verticalSpace(10),
                Text(
                  "user email",
                  style: TextStyles.font15DarkBlueMedium,
                ),
                verticalSpace(15),
                Card(
                  color: AppColors.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person_2_outlined, color: AppColors.kWhiteColor,),
                    
                        Text("Edit Profile", style: TextStyles.font18WhiteMedium),
                        Icon(Icons.arrow_forward_ios, color: AppColors.kWhiteColor,)
                    
                    
                    
                    ],),
                  ),
                ),
               
              ],
            ),
            
            ),
          
          
          ),),
    );
  }
}