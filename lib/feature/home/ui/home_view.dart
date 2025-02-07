import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';

import 'package:ecommerce_app/core/widgets/custom_search_field.dart';

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
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      
                      backgroundColor: AppColors.kPrimaryColor,
                      child: Icon(categories[index].icon,
                      size: 30.r,
                      color: AppColors.kWhiteColor,
            ),
            
                  ),
                  Text(categories[index].text,
                 
                  ),
                  
                  
                   ] ),

              ),
            ),  
          ),
  
      ],
      
      
         
      ),
    );
  }
}
List<Category> categories =[
  Category(icon: Icons.sports, text: "Sports"),
  Category(icon: Icons.laptop_mac_outlined, text: "Electronics"),
  Category(icon: Icons.collections, text: "Collections"),
  Category(icon: Icons.book_online_outlined, text: "Books"),
  Category(icon: Icons.games_outlined, text: "Games"),
];

class Category{
  final IconData icon;
  final String text;
  Category({required this.icon,required this.text});
}