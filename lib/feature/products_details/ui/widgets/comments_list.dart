import 'package:ecommerce_app/feature/products_details/ui/widgets/users_comments_list.dart';
import 'package:flutter/material.dart';


class CommentsList extends StatelessWidget {
  const CommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => UsersCommentsList(),
                                   separatorBuilder: (context, index) => Divider(),
                                    itemCount: 6);
  }
}