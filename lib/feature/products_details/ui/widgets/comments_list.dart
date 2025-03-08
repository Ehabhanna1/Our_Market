import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/theming/app_colors.dart';


import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
    required this.productModel,
  });
  final ProductsModel productModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client
            .from("comments_table")
            .stream(primaryKey: ["id"])
            .eq("for_product", productModel.productId!)
            .order("created_at"),
        builder: (_, snapshot) {
          List<Map<String, dynamic>>? data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>  UserComment(
                commentData: data?[index],
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: data?.length ?? 0,
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("No Comments Yet"),
            );
          } else {
            return const Center(
              child: Text("Something went error , please try again."),
            );
          }
        });
  }
}

class UserComment extends StatelessWidget {
  const UserComment({
    super.key, required this.commentData,
  });
  final Map<String, dynamic>? commentData;
   
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
     ) : Container(),
        
      ],
    );
  }
}