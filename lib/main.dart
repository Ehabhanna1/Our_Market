import 'package:ecommerce_app/core/functions/my_observe.dart';
import 'package:ecommerce_app/core/functions/senstive_data.dart';
import 'package:ecommerce_app/our_market.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qrevfiwchdguvtyztgus.supabase.co',
    anonKey: anonsKey,
  );

  Bloc.observer = MyObserve();

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
