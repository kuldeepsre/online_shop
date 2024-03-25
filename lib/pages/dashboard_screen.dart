import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/LanguageScreen.dart';

import 'package:online_shop/pages/profile_screen.dart';
import 'package:online_shop/pages/setting_screen.dart';
import 'package:online_shop/pages/view_more_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AppLocalizations.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';
import '../bloc/them/ThemeCubit.dart';
import '../common_button/LocalizationKeys.dart';
import '../utils/text_styles.dart';
import 'ZoomDrawer.dart';
import 'home_screen_page.dart';


class DashboardScrreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final textStyles = TextStyles(themeState);
    return Scaffold(
      backgroundColor:themeState.backgroundColor,
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.white,
        backgroundColor: const Color.fromRGBO(9, 18, 39, 1),
        title: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            String title =   AppLocalizations(context
                .read<LanguageCubit>()
                .state
                .locale)
                .translate(LocalizationKeys.dashboard);
            if (state is NavigationHome) {
              title =  AppLocalizations(context
                  .read<LanguageCubit>()
                  .state
                  .locale)
                  .translate(LocalizationKeys.dashboard);
            } else if (state is NavigationProfile) {
              title =   AppLocalizations(context
                  .read<LanguageCubit>()
                  .state
                  .locale)
                  .translate(LocalizationKeys.Profile);
            } else if (state is NavigationViewMore) {
              title =   AppLocalizations(context
                  .read<LanguageCubit>()
                  .state
                  .locale)
                  .translate(LocalizationKeys.ViewMore);
            } else if (state is NavigationSetting) {
              title =
              AppLocalizations(context
                  .read<LanguageCubit>()
                  .state
                  .locale)
                  .translate(LocalizationKeys.settings);
            }
            else if (state is NavigationLanguage) {

              title =  AppLocalizations(context
                  .read<LanguageCubit>()
                  .state
                  .locale)
                  .translate(LocalizationKeys.language);
            }
            return Text(title,style: textStyles.appBarTextStyle,);
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
