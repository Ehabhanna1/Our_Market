import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/feature/products_details/data/models/comment_data_model.dart';


import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key, required this.productsModel,  });

  final ProductsModel productsModel;
 
  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client
          .from("comments_table")
          .stream(primaryKey: ["id"])
          .eq("for_product", productsModel.productId!)
          .order("created_at"),
      builder: (_, snapshot) {
        List<Map<String, dynamic>>? data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => UserComment(
              commentData: data?[index],
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: data?.length ?? 0,
          );
        } else if (!snapshot.hasData) {
          return Center(
            child: Text("No Comments Yet"),
          );
        } else {
          return Center(
            child: Text("Something went error, try again,pleas"),
          );
        }
      },
    );
  }
}


class UserComment extends StatelessWidget {
  const UserComment({
    super.key, required this.commentData,
  });

  //final CommentDataModel commentData;
 final Map<String, dynamic>? commentData;
    // {
    //     "id": "c8c39960-4e79-496f-830c-d8712f48b8c3",
    //     "created_at": "2024-10-31T21:54:50.564511+00:00",
    //     "comment": "good product ui",
    //     "for_user": "469a8270-61e0-4e09-9e89-970b45026cb6",
    //     "for_product": "93523372-9b7f-46bd-9aa0-d775fdeb0f01",
    //     "user_name": "Karim",
    //     "replay": "This is replay"
    // }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Text(
             commentData?["user_name"] ?? "User Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              commentData?["comment"] ?? "Comment",
            ),
          ],
        ),
     commentData?["replay"] != null ?   
     Column(
       children: [
         Row(
              children: [
                Text(
                  "Replay:-",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
          children: [
            Text(
              commentData!["replay"],
            ),
          ],
        ),
       ],
     ) : Shimmer.fromColors(
      // ignore: sort_child_properties_last
      child:  Text("Comments",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      baseColor: AppColors.kPrimaryColor,
       highlightColor: Colors.pink),
        
      ],
    );
  }
}
