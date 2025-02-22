import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/products_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Text(
            "Your Favorite Products",
            textAlign: TextAlign.center,
            style: TextStyles.font24BlackBold,
          ),
          verticalSpace(10),
          ProductsListView(),
        ],
      ),
    );
  }
}
