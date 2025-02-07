import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';


class RowRatingNumberAndAddFavorite extends StatelessWidget {
  const RowRatingNumberAndAddFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Row(
                                children: [
                                  Text(
                                "4 ", style: TextStyles.font15DarkBlueMedium,
                                  ),

                                 Icon(Icons.star, color: Colors.amber,size: 25,),
                               ],),

                               Icon(Icons.favorite_border_outlined, color: AppColors.kGreyColor,size: 30,),
                              ],
                             );
  }
}