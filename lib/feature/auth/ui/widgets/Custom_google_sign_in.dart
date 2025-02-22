import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGoogleSignIn extends StatelessWidget {
  final void Function()? onTap;
  const CustomGoogleSignIn({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/google.png",
            width: 40.w,
            height: 40.h,
          ),
          verticalSpace(8),
          Text(
            "Google",
            style: TextStyles.font18BlackBold,
          ),
        ],
      ),
    );
  }
}
