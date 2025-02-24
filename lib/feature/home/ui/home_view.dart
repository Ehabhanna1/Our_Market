import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_search_field.dart';
import 'package:ecommerce_app/core/widgets/products_list_view.dart';
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
          Text(
            "Welcome To Our Market",
            textAlign: TextAlign.center,
            style: TextStyles.font24BlackBold,
          ),
          verticalSpace(10),
          CustomSearchField(),
          verticalSpace(20),
          SizedBox(
            height: 200.h,
            width: 300.w,
             child: AnotherCarousel(
              autoplay: true,
              autoplayDuration: const Duration(seconds: 7),
              dotBgColor: Colors.transparent,
              dotIncreasedColor: AppColors.kPrimaryColor,
              images: [
                Image.asset("assets/images/onboardingone.png"),
                Image.asset("assets/images/onboardingtwo.png"),
                Image.asset("assets/images/onboardingthree.png"),
              ],
  
              
              
              ),
              ),
          verticalSpace(10),
          Text(
            "Popular Categories",
            style: TextStyles.font20DarkRegular,
          ),
          verticalSpace(10),
          CategoriesList(),
          verticalSpace(8),
          Text(
            "Recently Products",
            style: TextStyles.font20DarkRegular,
          ),
          verticalSpace(6),
          ProductsListView(),
        ],
      ),
    );
  }
}
