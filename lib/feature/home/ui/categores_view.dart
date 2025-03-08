import 'package:ecommerce_app/core/functions/build_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/products_list_view.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, category),

      body: Padding(
        padding: const EdgeInsets.only(top: 15,),
        child: ProductsListView(
          category: category,
        ),
      ),
    );
  }
}