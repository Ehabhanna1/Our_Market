import 'package:ecommerce_app/core/functions/build_custom_app_bar.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/app_rating_bar.dart';
import 'package:ecommerce_app/core/widgets/app_text_form_field.dart';
import 'package:ecommerce_app/core/widgets/cached_network_image.dart';
import 'package:ecommerce_app/feature/products_details/ui/widgets/comments_list.dart';
import 'package:ecommerce_app/feature/products_details/ui/widgets/row_product_name_and_price.dart';
import 'package:ecommerce_app/feature/products_details/ui/widgets/row_rating_number_and_add_favorite.dart';
import 'package:flutter/material.dart';

class ProductsDatailsView extends StatelessWidget {
  const ProductsDatailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Product Name"),
      body: ListView(
        children: [
          CustomCachedNetworkImage(
            url:
                "https://img.freepik.com/free-vector/realistic-cream-advertisement_52683-8098.jpg?uid=R184239962&ga=GA1.1.1137416873.1736544603&semt=ais_hybrid",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            child: Column(
              children: [
                RowProductNameAndPrice(),
                verticalSpace(20),
                RowRatingNumberAndAddFavorite(),
                verticalSpace(30),
                Text(
                  "Product Description",
                  style: TextStyles.font20DarkRegular,
                ),
                verticalSpace(20),
                AppRatingBar(),
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
  }
}
