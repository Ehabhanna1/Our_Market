import 'package:ecommerce_app/core/helper/spacing.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:ecommerce_app/core/widgets/cached_network_image.dart';
import 'package:ecommerce_app/core/widgets/custom_elevation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(

          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)
                    ),
                    child: CustomCachedNetworkImage(
                      url: "https://img.freepik.com/free-vector/realistic-cream-advertisement_52683-8098.jpg?uid=R184239962&ga=GA1.1.1137416873.1736544603&semt=ais_hybrid",
                     
                      
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
                      child: Text("10% OFF",
                      textAlign: TextAlign.center,
                      style: TextStyles.font13WhiteRegular,),
                      
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
                        Text("Product Name",
                        style: TextStyles.font18BlackSemiBold,),
                        IconButton(
                          onPressed: (){},
                           icon: Icon(Icons.favorite_border_outlined,
                           color: AppColors.kGreyColor,
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
                           Text("100 LE",
                        style: TextStyles.font18BlackSemiBold,),
                        

                           Text("120 LE",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.kGreyColor,
                          fontSize: 18.sp
                        ),),

                        ],
                       ),
                      CustomElevationButton(
                        text: "Buy Now",
                       
                        onTap: (){},
                        
                        
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
         );
  }
}