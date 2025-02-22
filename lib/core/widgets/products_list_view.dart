import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/logics/cubit/home_view_cubit.dart';
import 'package:ecommerce_app/core/widgets/card_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListView extends StatelessWidget {
  final bool? shrinkWrap;
  final ScrollPhysics? physics;

  const ProductsListView({super.key, this.shrinkWrap, this.physics});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubit()..getProducts(),
      child: BlocConsumer<HomeViewCubit, HomeViewState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ProductsModel> products = context.read<HomeViewCubit>().products;

          return state is GetDataLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: shrinkWrap ?? true,
                  physics: physics ?? NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CardProducts(
                      product: products[index],
                    );
                  },
                );
        },
      ),
    );
  }
}
