import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 250,
      width: double.infinity,
      fit: BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) => SizedBox(
        height: 100.h,
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
