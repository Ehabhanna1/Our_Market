import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RowProductNameAndPrice extends StatelessWidget {
  const RowProductNameAndPrice({
    super.key,
    required this.product,
  });

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.productName ?? "Product Name",
          style: TextStyles.font18BlackSemiBold,
        ),
        Text(
          "${product.price} LE",
          style: TextStyles.font18BlackBold,
        ),
      ],
    );
  }
}
