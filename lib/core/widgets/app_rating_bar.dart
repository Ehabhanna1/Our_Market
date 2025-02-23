import 'package:ecommerce_app/feature/products_details/logic/cubit/products_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppRatingBar extends StatefulWidget {
  const AppRatingBar({super.key});

  @override
  State<AppRatingBar> createState() => _AppRatingBarState();
}

class _AppRatingBarState extends State<AppRatingBar> {
  @override
  Widget build(BuildContext context) {
    ProductsDetailsCubit cubit = context.read<ProductsDetailsCubit>();

    return BlocProvider(
      create: (context) => ProductsDetailsCubit(),
      child: RatingBar.builder(
        initialRating: cubit.userRate.toDouble(),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
