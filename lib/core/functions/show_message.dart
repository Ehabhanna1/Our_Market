import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: AppColors.kPrimaryColor,
  ));
}
