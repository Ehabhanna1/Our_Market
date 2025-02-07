import 'package:ecommerce_app/core/widgets/card_products.dart';
import 'package:flutter/material.dart';


class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          
          itemBuilder: (context, index){
            return CardProducts();
          }  ,);
  }
}