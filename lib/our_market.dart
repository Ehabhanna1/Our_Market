import 'package:ecommerce_app/feature/auth/logic/cubit/authentication_cubit.dart';
import 'package:ecommerce_app/feature/auth/ui/login_view.dart';
import 'package:ecommerce_app/feature/main_nav_bar/ui/main_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => AuthenticationCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Our Market',
          home: client.auth.currentUser != null
              ? MainNavBar()
              : const LoginView(),
        ),
      ),
    );
  }
}

//client.auth.currentUser != null? MainNavBar() :
