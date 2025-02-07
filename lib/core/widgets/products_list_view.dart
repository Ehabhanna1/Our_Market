import 'package:ecommerce_app/core/widgets/card_products.dart';
import 'package:flutter/material.dart';


class ProductsListView extends StatelessWidget {

 final bool? shrinkWrap;
 final ScrollPhysics? physics;




  const ProductsListView({super.key, this.shrinkWrap, this.physics});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: shrinkWrap ?? true,
          physics: physics ?? NeverScrollableScrollPhysics(),
          itemCount: 10,
          
          itemBuilder: (context, index){
            return CardProducts();
          }  ,);
  }
}