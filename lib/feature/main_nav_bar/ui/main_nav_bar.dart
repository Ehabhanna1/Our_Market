import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:ecommerce_app/feature/favorites/ui/favorites_view.dart';
import 'package:ecommerce_app/feature/home/ui/home_view.dart';
import 'package:ecommerce_app/feature/main_nav_bar/logic/cubit/nav_bar_cubit.dart';
import 'package:ecommerce_app/feature/profile/ui/profile_view.dart';
import 'package:ecommerce_app/feature/store/ui/store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class MainNavBar extends StatelessWidget {
  MainNavBar({super.key});

  final List<Widget> views = [
    const HomeView(),
    const StoreView(),
    const FavoritesView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit navBarCubit = context.read<NavBarCubit>();
          return Scaffold(
            body: SafeArea(
              child: views[navBarCubit.currentIndex],
            ),
            bottomNavigationBar: Container(
              color: AppColors.kWhiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: GNav(
                    onTabChange: (index) {
                      navBarCubit.changeCurrentIndex(index);
                    },
                    rippleColor: AppColors
                        .kPrimaryColor, // tab button ripple color when pressed
                    hoverColor:
                        AppColors.kPrimaryColor, // tab button hover color

                    // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
                    // curve: Curves.easeOutExpo, // tab animation curves
                    duration:
                        Duration(milliseconds: 400), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: AppColors.kGreyColor, // unselected icon color
                    activeColor:
                        AppColors.kWhiteColor, // selected icon and text color
                    iconSize: 30, // tab button icon size
                    tabBackgroundColor: AppColors
                        .kPrimaryColor, // selected tab background color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // navigation bar padding
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.store_mall_directory_outlined,
                        text: 'Store',
                      ),
                      GButton(
                        icon: Icons.favorite_border_outlined,
                        text: 'Favorites',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
