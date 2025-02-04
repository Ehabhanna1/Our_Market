import 'package:ecommerce_app/feature/auth/ui/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const OurStore());
}

class OurStore extends StatelessWidget {
  const OurStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Our Store',
      theme: ThemeData(
       
       
       
      ),
      home: const LoginView(),
    );
  }
}


