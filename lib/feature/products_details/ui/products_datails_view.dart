import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/functions/build_custom_app_bar.dart';
import 'package:ecommerce_app/core/functions/navigation.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';

import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/core/widgets/cached_network_image.dart';
import 'package:ecommerce_app/feature/auth/logic/cubit/authentication_cubit.dart';
import 'package:ecommerce_app/feature/products_details/logic/cubit/products_details_cubit.dart';
import 'package:ecommerce_app/feature/products_details/ui/widgets/comments_list.dart';
import 'package:ecommerce_app/feature/products_details/ui/widgets/row_product_name_and_price.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class ProductsDatailsView extends StatefulWidget {
  const ProductsDatailsView({super.key, required this.product});
  final ProductsModel product;

  @override
  State<ProductsDatailsView> createState() => _ProductsDatailsViewState();
}

class _ProductsDatailsViewState extends State<ProductsDatailsView> {

  final TextEditingController _commentController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDetailsCubit()..getRating(productId: widget.product.productId!),
      child: BlocConsumer<ProductsDetailsCubit, ProductsDetailsState>(
        listener: (context, state) {
          if (state is AddOrUpdateRateSuccess) {
            navigatePushReplacement(context, Widget as Widget);
          }
          
        },
        builder: (context, state) {
          ProductsDetailsCubit cubit = context.read<ProductsDetailsCubit>();


          return Scaffold(
            appBar: buildCustomAppBar(context,
            
            widget.product.productName ?? "Product Name"),
            body: state is GetRateLoading || state is AddCommentLoading ?
              Center(
                   
                        child: Shimmer.fromColors(
                                     baseColor: AppColors.kPrimaryColor,
                             highlightColor: Colors.red,
                                    child: Text(
                                  'Loading',
                                   textAlign: TextAlign.center,
                                  style: TextStyle(
                                          fontSize: 40.0,
                                fontWeight:
                               FontWeight.bold,
                               ),
                                   ),
                               ),
                               )
             
             
             
             : ListView(
              children: [
                CustomCachedNetworkImage(
                  url: widget.product.imageUrl ??
                      "https://img.freepik.com/free-vector/realistic-cream-advertisement_52683-8098.jpg?uid=R184239962&ga=GA1.1.1137416873.1736544603&semt=ais_hybrid",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: Column(
                    children: [
                      RowProductNameAndPrice(
                        product: widget.product,
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
                        widget.product.discription ?? "Product Description",
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
                                        productId: widget.product.productId!,
                                         data: {
                                                         "for_user": cubit.userId,
                                                "for_product": widget.product.productId,
                                               "rate": rating.toInt(),
                                                        });
                                                   },
                                                ),
                      verticalSpace(20),
                      AppTextFormField(
                        controller: _commentController,
                          hintText: "Type Your Feedback",
                          validator: (value) {},
                          labelText: "Enter Your Feedback",
                          suffixIcon: IconButton(
                            onPressed: () async {
                             await cubit.addComment(
                                data: {
                                      "comment": _commentController.text,
                                      "for_user": cubit.userId,
                                      "for_product": widget.product.productId,
                                      "user_name": context.read<AuthenticationCubit>().usersDataModel?.name?? "User is Null"
                                            
                                    },
                                    
                                );
                                _commentController.clear();

                            },
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
                      CommentsList(productsModel: widget.product,),
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
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
