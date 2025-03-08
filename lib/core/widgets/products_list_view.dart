import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/logics/cubit/home_view_cubit.dart';
import 'package:ecommerce_app/core/widgets/card_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListView extends StatelessWidget {
  final bool? shrinkWrap;
  final ScrollPhysics? physics;

  final String? query;

  const ProductsListView({super.key, this.shrinkWrap, this.physics, this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubit()..getProducts(query: query),
      child: BlocConsumer<HomeViewCubit, HomeViewState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ProductsModel> products = query != null ? context.read<HomeViewCubit>().searchResults : context.read<HomeViewCubit>().products;

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
