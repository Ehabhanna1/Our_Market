import 'package:ecommerce_app/core/functions/build_custom_app_bar.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/app_text_button.dart';
import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';

import 'package:flutter/material.dart';

class EditNameView extends StatelessWidget {
  const EditNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Edit Name"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            verticalSpace(30),
            AppTextFormField(
              hintText: "Enter Your Name",
              validator: (value) {},
              labelText: "Name",
              suffixIcon: Icon(
                Icons.person_2_outlined,
                size: 25,
                color: AppColors.kGreyColor,
              ),
            ),
            verticalSpace(30),
            AppTextButton(
              buttonText: "Update",
              textStyle: TextStyles.font18WhiteBold,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
