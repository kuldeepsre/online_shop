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

import '../custom_widget/LocalizationKeys.dart';
import '../utils/text_styles.dart';
import 'CartPage.dart';
import 'MotionTabBar.dart';
import 'ZoomDrawer.dart';
import 'home_screen_page.dart';


class DashboardScrreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final textStyles = TextStyles(themeState);
    return Scaffold(
      backgroundColor: themeState.backgroundColor,
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.white,
        backgroundColor: const Color.fromRGBO(9, 18, 39, 1),
        title: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            String title =
                AppLocalizations(context.read<LanguageCubit>().state.locale)
                    .translate(LocalizationKeys.dashboard);
            if (state is NavigationHome) {
              title =
                  AppLocalizations(context.read<LanguageCubit>().state.locale)
                      .translate(LocalizationKeys.dashboard);
            } else if (state is NavigationProfile) {
              title =
                  AppLocalizations(context.read<LanguageCubit>().state.locale)
                      .translate(LocalizationKeys.Profile);
            } else if (state is NavigationViewMore) {
              title =
                  AppLocalizations(context.read<LanguageCubit>().state.locale)
                      .translate(LocalizationKeys.ViewMore);
            } else if (state is NavigationSetting) {
              title =
                  AppLocalizations(context.read<LanguageCubit>().state.locale)
                      .translate(LocalizationKeys.settings);
            } else if (state is NavigationLanguage) {
              title =
                  AppLocalizations(context.read<LanguageCubit>().state.locale)
                      .translate(LocalizationKeys.language);
            }
            return Text(
              title,
              style: textStyles.appBarTextStyle,
            );
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
          } else if (state is NavigationLanguage) {
            return LanguageScreen();
          }
          return HomeScreen(); // Default empty container
        },
      ),
      drawer: ZoomDrawer(),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int _selectedIndex = 0; // Default index
          if (state is NavigationHome) {
            _selectedIndex = 0;
          } else if (state is NavigationProfile) {
            _selectedIndex = 1;
          } else if (state is NavigationLanguage) {
            _selectedIndex = 2;
          } else if (state is NavigationViewMore) {
            _selectedIndex = 3;
          }
          return MotionTabController(
            initialSelectedTab: "Dashboard",
            tabBarHeight: 56,
            // Adjust the height as needed
            tabIconColor: themeState.textColor,
            // Change the color as needed
            tabSelectedColor: Colors.redAccent,

            onTabItemSelected: (String tabName) {
              // Dispatch navigation events based on the selected tab
              switch (NavigationBloc) {
                case "Dashboard":
                  BlocProvider.of<NavigationBloc>(context).add(GoToHomeEvent());
                  break;
                case "Profile":
                  BlocProvider.of<NavigationBloc>(context)
                      .add(GoToProfileEvent());
                  break;
                case "View More":
                  BlocProvider.of<NavigationBloc>(context)
                      .add(GoToPageViewMoreEvent());
                  break;
                  case "Language":
                  BlocProvider.of<NavigationBloc>(context)
                      .add(GoToPageLanguageEvent());
                  break;
                // Add more cases for additional tabs if needed
              }
            },
            labels: [
              AppLocalizations(context.read<LanguageCubit>().state.locale)
                  .translate(LocalizationKeys.dashboard),
              AppLocalizations(context.read<LanguageCubit>().state.locale)
                  .translate(LocalizationKeys.Profile),
              AppLocalizations(context.read<LanguageCubit>().state.locale)
                  .translate(LocalizationKeys.language),
              AppLocalizations(context.read<LanguageCubit>().state.locale)
                  .translate(LocalizationKeys.ViewMore),

            ],
            icons: const [
              Icons.home,
              Icons.person,

              Icons.language,
              Icons.grid_view,
            ],
            tabFormat: TabFormat.icon,
          );
        },
      ),
    );
  }
}
