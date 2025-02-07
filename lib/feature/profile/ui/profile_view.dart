import 'package:ecommerce_app/core/functions/navigation.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/feature/profile/ui/edit_name_view.dart';
import 'package:ecommerce_app/feature/profile/ui/widgets/custom_row_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height *0.70,
        
        child: Card(
              color: AppColors.kWhiteColor,
               
                 margin: const EdgeInsets.all(24),
              shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                   Radius.circular(16),
                     ),
               ),
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
                    CustomRowButton(
                      onTap: (){
                        navigateTo(context, const EditNameView());
                      },
                      text: 'Edit Name',
                      icon: Icons.person_2_outlined,
                      
                      ),
                      verticalSpace(15),
                      CustomRowButton(
                      onTap: (){},
                      text: 'My Orders',
                      icon: Icons.shopping_bag_outlined,
                      ),
                      verticalSpace(15),
                      CustomRowButton(
                      onTap: (){},
                      text: 'Logout',
                      icon: Icons.logout_outlined,
                      ),
                   
                   
                  ],
                ),
                
                ),
              
              
        ),
      ),
    );
  }
}