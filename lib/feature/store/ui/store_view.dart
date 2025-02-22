import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_search_field.dart';
import 'package:ecommerce_app/core/widgets/products_list_view.dart';
import 'package:flutter/material.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Text(
            "Welcome To Our Market",
            textAlign: TextAlign.center,
            style: TextStyles.font24BlackBold,
          ),
          verticalSpace(10),
          CustomSearchField(),
          verticalSpace(20),
          ProductsListView(),
        ],
      ),
    );
  }
}
