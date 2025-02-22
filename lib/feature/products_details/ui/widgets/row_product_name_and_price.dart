import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RowProductNameAndPrice extends StatelessWidget {
  const RowProductNameAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Product Name",
          style: TextStyles.font18BlackSemiBold,
        ),
        Text(
          "220 LE",
          style: TextStyles.font18BlackBold,
        ),
      ],
    );
  }
}
