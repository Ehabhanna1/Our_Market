import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class CustomRowButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final IconData icon;

  const CustomRowButton(
      {super.key, this.onTap, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: AppColors.kWhiteColor,
              ),
              Text(text, style: TextStyles.font18WhiteBold),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.kWhiteColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
