import 'package:flutter/material.dart';

Future<dynamic> navigateTo(BuildContext context, Widget view) {
  
  return Navigator.push(context, MaterialPageRoute(builder: (context) => view));
}

Future<dynamic> navigatePushReplacement(BuildContext context, Widget view) {
  
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => view));
}