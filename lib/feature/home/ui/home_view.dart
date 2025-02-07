import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';

import 'package:ecommerce_app/core/widgets/custom_search_field.dart';
import 'package:ecommerce_app/feature/home/ui/widgets/categories_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          CustomSearchField(),
          verticalSpace( 20),
          Image.asset("assets/images/onboardingone.png",
          width: double.maxFinite,
          height: 220.h,
          
          ),
          verticalSpace( 10),
          Text("Popular Categories",
          style: TextStyles.font20DarRegular,
          ),
          verticalSpace( 10),
         CategoriesList(),
         verticalSpace(15),
         Card(

          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)
                    ),
                    child: Image(
                      image: NetworkImage("https://img.freepik.com/free-vector/beautiful-cosmetic-ad_23-2148471068.jpg?uid=R184239962&ga=GA1.1.1137416873.1736544603&semt=ais_hybrid"),
                      height: 150.h,
                      width: double.maxFinite,
                      fit: BoxFit.fill,
                      ),

                  ),
                  Positioned(
                    child: Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(18),
                          
                          
                        ),
                      ),
                      child: Text("10% OFF",
                      textAlign: TextAlign.center,
                      style: TextStyles.font13WhiteRegular,),
                      
                      ),
                    ),
                 
                 
                ],
              ),
            ],
          ),
         ),
  
      ],
      
      
         
      ),
    );
  }
}