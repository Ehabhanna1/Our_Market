import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.kPrimaryColor,
              child: Icon(
                categories[index].icon,
                size: 30.r,
                color: AppColors.kWhiteColor,
              ),
            ),
            Text(
              categories[index].text,
            ),
          ]),
        ),
      ),
    );
  }
}

List<Category> categories = [
  Category(icon: Icons.sports, text: "Sports"),
  Category(icon: Icons.laptop_mac_outlined, text: "Electronics"),
  Category(icon: Icons.collections, text: "Collections"),
  Category(icon: Icons.book_online_outlined, text: "Books"),
  Category(icon: Icons.games_outlined, text: "Games"),
  Category(icon: Icons.badge_outlined, text: "Badges"),
];

class Category {
  final IconData icon;
  final String text;
  Category({required this.icon, required this.text});
}
