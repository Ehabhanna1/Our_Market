import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/functions/navigation.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/cached_network_image.dart';
import 'package:ecommerce_app/core/widgets/custom_elevation_button.dart';
import 'package:ecommerce_app/feature/products_details/ui/products_datails_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({super.key, required this.product, this.onPressed, required this.isFavorite});

  final ProductsModel product;
  final void Function()? onPressed;
  final bool isFavorite ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            ProductsDatailsView(
              product: product,
            ));
      },
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)),
                  child: CustomCachedNetworkImage(
                    url: product.imageUrl ??
                        "https://img.freepik.com/free-psd/macbook-mockup_1332-60596.jpg?t=st=1740220122~exp=1740223722~hmac=7b33a7d18d6fab59b50652c21a3146a350f3dfe71a5feaa834db53465810eaf5&w=1380",
                  ),
                ),
                Positioned(
                  child: Container(
                    alignment: Alignment.center,
                    width: 55.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    child: Text(
                      "${product.sale}% OFF",
                      textAlign: TextAlign.center,
                      style: TextStyles.font13WhiteRegular,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.productName ?? "Product Name",
                        style: TextStyles.font18BlackSemiBold,
                      ),
                      IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? AppColors.kPrimaryColor : AppColors.kGreyColor,
                          size: 25.sp,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${product.price} LE",
                            style: TextStyles.font18BlackSemiBold,
                          ),
                          Text(
                            "${product.oldPrice} LE",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.kGreyColor,
                                fontSize: 18.sp),
                          ),
                        ],
                      ),
                      CustomElevationButton(
                        text: "Buy Now",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
