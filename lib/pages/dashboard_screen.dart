import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/LanguageScreen.dart';

import 'package:online_shop/pages/profile_screen.dart';
import 'package:online_shop/pages/setting_screen.dart';
import 'package:online_shop/pages/view_more_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation_bloc/navigation_bloc.dart';
import '../bloc/them/ThemeCubit.dart';
import 'ZoomDrawer.dart';
import 'home_screen_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    return Scaffold(
      backgroundColor:themeState.backgroundColor,
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.white,
        backgroundColor: const Color.fromRGBO(9, 18, 39, 1),
        title: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            String title = 'Dashboard';
            if (state is NavigationHome) {
              title = 'Dashboard';
            } else if (state is NavigationProfile) {
              title = 'Profile';
            } else if (state is NavigationViewMore) {
              title = 'View More';
            } else if (state is NavigationSetting) {
              title = 'Settings';
            }
            else if (state is NavigationLanguage) {
              title = 'Language ';
            }
            return Text(title);
          },
        ),

      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationHome) {
            return HomeScreen();
          } else if (state is NavigationProfile) {
            return ProfileScreen();
          } else if (state is NavigationViewMore) {
            return ViewMoreScreen();
          } else if (state is NavigationSetting) {
            return SettingsScreen();
          }
          else if (state is NavigationLanguage) {
            return LanguageScreen();
          }
          return HomeScreen(); // Default empty container
        },
      ),
      drawer: ZoomDrawer(),
    );
  }
}
