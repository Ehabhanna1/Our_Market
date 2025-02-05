import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';


class CustomElevationButton extends StatelessWidget {
  const CustomElevationButton({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: Text(text),
      ),
    );
  }
}