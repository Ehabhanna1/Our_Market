import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onTap,
    required this.textButton,
  });
  final void Function()? onTap;
  final String textButton;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        textButton,
        style: const TextStyle(
          color: AppColors.kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}