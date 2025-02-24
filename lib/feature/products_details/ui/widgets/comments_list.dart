import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/feature/products_details/ui/widgets/users_comments_list.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key, required this.productsModel});


  final ProductsModel productsModel ;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.from("comments_table")
      .stream(primaryKey: ["id"]).
      eq("for_product", productsModel.productId!).order("created_at"),

      builder: (_,  snapshot) { 
        List<Map<String,dynamic>>? data = snapshot.data;
        if( snapshot.connectionState == ConnectionState.waiting ){
          return  SizedBox(
                     width: 200.0,
                        height: 100.0,
                          child: Shimmer.fromColors(
                            baseColor: AppColors.kPrimaryColor,
                            highlightColor: Colors.yellow,
                                       child: Text(
                                           'Shimmer',
                                     textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 40.0,
                                  fontWeight:
                                         FontWeight.bold,
                            ),
                                      ),
                          ),
                            );
                          }else if(snapshot.hasData){
                             return ListView.separated(
                         shrinkWrap: true,
                               physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => UsersCommentsList(),
                                separatorBuilder: (context, index) => Divider(),
                                  itemCount: 6
                                  );
                          }else if (!snapshot.hasData){
                            return Center(child: Text("No Comments Yet"),);
                           

                          }else{
                             return Center(child: Text("Something went error, try again,pleas"),);
                          }

       
       },
     
    );
  }
}



