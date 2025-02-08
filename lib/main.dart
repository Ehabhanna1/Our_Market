import 'package:ecommerce_app/our_market.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://qrevfiwchdguvtyztgus.supabase.co',
    
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFyZXZmaXdjaGRndXZ0eXp0Z3VzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkwMTg0ODQsImV4cCI6MjA1NDU5NDQ4NH0.behbp7tkSLXajcRY41rnQO3nQGL-Sz6HS1LnX5M6Vss',
  );

  runApp(const OurMarket());
}

//class OurMarket extends StatelessWidget {
 // const OurMarket({super.key});

  // This widget is the root of your application.
 // @override
 // Widget build(BuildContext context) {
  //  return MaterialApp(
  //    debugShowCheckedModeBanner: false,
   //   title: 'Our Market',
   //   theme: ThemeData(
     //   scaffoldBackgroundColor: AppColors.kScaffoldColor,
       
       
       
    //  ),
   //   home: const LoginView(),
   // );
 // }
//}


