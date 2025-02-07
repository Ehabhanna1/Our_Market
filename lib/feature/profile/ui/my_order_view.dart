import 'package:ecommerce_app/core/functions/build_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/products_list_view.dart';
import 'package:flutter/material.dart';


class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  buildCustomAppBar(context, "My ORder"),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ProductsListView(
          shrinkWrap: false,
          physics: BouncingScrollPhysics(),
        ),
        
        ),
    );
  }
}