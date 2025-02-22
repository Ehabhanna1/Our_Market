import 'package:ecommerce_app/core/theming/app_colors.dart';

import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "Search....",
      validator: (value) {},
      labelText: "Search in Market",
      suffixIcon: IconButton(
        style: ButtonStyle(
          // ignore: deprecated_member_use
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // ignore: deprecated_member_use
          backgroundColor: MaterialStatePropertyAll(
            AppColors.kPrimaryColor,
          ),
          // ignore: deprecated_member_use
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 14.h,
            ),
          ),
          // ignore: deprecated_member_use
        ),
        onPressed: () {},
        icon: Icon(
          Icons.search,
          size: 30,
          color: AppColors.kWhiteColor,
        ),
      ),
    );
  }
}
