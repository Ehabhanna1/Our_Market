import 'package:ecommerce_app/core/functions/build_custom_app_bar.dart';
import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ProductsDatailsView extends StatelessWidget {
  const ProductsDatailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  buildCustomAppBar(context, "Product Name"),
      body:  ListView(
        children: [
           CustomCachedNetworkImage(
                        url: "https://img.freepik.com/free-vector/realistic-cream-advertisement_52683-8098.jpg?uid=R184239962&ga=GA1.1.1137416873.1736544603&semt=ais_hybrid",
                       
                        
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 16),
                          child: Column(
                            children: [
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                "Product Name",
                                style: TextStyles.font18BlackSemiBold,      
                              ),
                               Text(
                                "220 LE",
                                style: TextStyles.font18BlackBold,      
                              ),
                              ],
                             ),
                             verticalSpace(20),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Row(
                                children: [
                                  Text(
                                "4 ", style: TextStyles.font15DarkBlueMedium,
                                  ),

                                 Icon(Icons.star, color: Colors.amber,size: 25,),
                               ],),

                               Icon(Icons.favorite_border_outlined, color: AppColors.kGreyColor,size: 30,),
                              ],
                             ),

                               verticalSpace(30),
                               Text(
                                "Product Description",
                                style: TextStyles.font20DarkRegular,
                               ),
                               verticalSpace(20),
                               RatingBar.builder(
                                 initialRating: 3,
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


                            ],
                          ),
                          
                          ),
        ],
      ),
    );
  }
}