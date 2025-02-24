import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/functions/build_custom_app_bar.dart';
import 'package:ecommerce_app/core/functions/navigation.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';

import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/core/widgets/cached_network_image.dart';
import 'package:ecommerce_app/feature/products_details/logic/cubit/products_details_cubit.dart';
import 'package:ecommerce_app/feature/products_details/ui/widgets/comments_list.dart';
import 'package:ecommerce_app/feature/products_details/ui/widgets/row_product_name_and_price.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductsDatailsView extends StatelessWidget {
  const ProductsDatailsView({super.key, required this.product});
  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDetailsCubit()..getRating(productId: product.productId!),
      child: BlocConsumer<ProductsDetailsCubit, ProductsDetailsState>(
        listener: (context, state) {
          if (state is AddOrUpdateRateSuccess) {
            navigatePushReplacement(context, this);
          }
          
        },
        builder: (context, state) {
          ProductsDetailsCubit cubit = context.read<ProductsDetailsCubit>();


          return Scaffold(
            appBar: buildCustomAppBar(context,
            
            product.productName ?? "Product Name"),
            body: state is GetRateLoading ?
             const Center(child: CircularProgressIndicator()) : ListView(
              children: [
                CustomCachedNetworkImage(
                  url: product.imageUrl ??
                      "https://img.freepik.com/free-vector/realistic-cream-advertisement_52683-8098.jpg?uid=R184239962&ga=GA1.1.1137416873.1736544603&semt=ais_hybrid",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: Column(
                    children: [
                      RowProductNameAndPrice(
                        product: product,
                      ),

                      verticalSpace(20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                      Row(
                          children: [
                             Text(
                               "${cubit.averageRate} ",
                             style: TextStyles.font15DarkBlueMedium,
                               ),
                        Icon(
                            Icons.star,
                                 color: Colors.amber,
                             size: 25,
                             ),
                                     ],
                                   ),
                     Icon(
                     Icons.favorite_border_outlined,
                    color: AppColors.kGreyColor,
                    size: 30,
                      ),
                         ],
                    ),
                    
                      verticalSpace(30),
                      Text(
                        product.discription ?? "Product Description",
                        style: TextStyles.font20DarkRegular,
                      ),
                      verticalSpace(20),
                      RatingBar.builder(
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
                                       cubit.addOrUpdateUserRate(
                                        productId: product.productId!,
                                         data: {
                                                         "for_user": cubit.userId,
                                                "for_product": product.productId,
                                               "rate": rating.toInt(),
                                                        });
                                                   },
                                                ),
                      verticalSpace(20),
                      AppTextFormField(
                          hintText: "Type Your Feedback",
                          validator: (value) {},
                          labelText: "Your Feedback",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send_outlined,
                              //color: AppColors.kGreyColor,
                              size: 25,
                            ),
                          )),
                      verticalSpace(20),
                      Text(
                        "Comments",
                        style: TextStyles.font20DarkRegular,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpace(20),
                      CommentsList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
