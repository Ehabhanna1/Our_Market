import 'package:ecommerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';


class UsersCommentsList extends StatelessWidget {
  const UsersCommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("User Name", style: TextStyles.font18BlackSemiBold,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("comment...", style: TextStyles.font15DarkBlueRegular,),
                                        ],
                                      ),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Reply Admin", style: TextStyles.font18BlackSemiBold,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Reply.....", style: TextStyles.font15DarkBlueRegular,),
                                        ],
                                      ),
                                    ],
                                  );
  }
}