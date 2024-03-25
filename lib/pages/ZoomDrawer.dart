import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../AppLocalizations.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';
import '../bloc/them/ThemeCubit.dart';
import '../common_button/LocalizationKeys.dart';
import '../utils/text_styles.dart';

class ZoomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final textStyles = TextStyles(themeState);
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: themeState.backgroundColor),
        child: ListView(
          children: [
            ListTile(
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: themeState.iconColor)),
              trailing: GestureDetector(
                  onTap: () {
                    context.read<ThemeCubit>().toggleTheme();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.dark_mode, color: themeState.iconColor)),
            ),
            Divider(
              color: themeState.backgroundColor,
              thickness: 1.0,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: themeState.iconColor,
              ),
              title: Text(
                AppLocalizations(context.read<LanguageCubit>().state.locale)
                    .translate(LocalizationKeys.Home),
                textAlign: TextAlign.left,
                style: textStyles.titleTextStyle,
              ),
              onTap: () {
                BlocProvider.of<NavigationBloc>(context)
                    .add(GoToHomeEvent(title: "Home"));
                Navigator.pop(context);
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: .4,
            ),
            ListTile(
              leading: Icon(Icons.verified_user, color: themeState.iconColor),
              title: // Figma Flutter Generator ProfileWidget - TEXT
                  Text(
                AppLocalizations(context.read<LanguageCubit>().state.locale)
                    .translate(LocalizationKeys.Profile),
                textAlign: TextAlign.left,
                style: textStyles.titleTextStyle,
              ),
              onTap: () {
                BlocProvider.of<NavigationBloc>(context)
                    .add(GoToProfileEvent(title: "PRofile"));
                Navigator.pop(context);
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: .4,
            ),
            ListTile(
              leading: Icon(Icons.more, color: themeState.iconColor),
              title: Text(
                AppLocalizations(context.read<LanguageCubit>().state.locale)
                    .translate(LocalizationKeys.ViewMore),
                textAlign: TextAlign.left,
                style: textStyles.titleTextStyle,
              ),
              onTap: () {
                BlocProvider.of<NavigationBloc>(context)
                    .add(GoToPageViewMoreEvent(title: "View More"));
                Navigator.pop(context);
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: .4,
            ),
            ListTile(
              leading: Icon(Icons.settings, color: themeState.iconColor),
              title: Text(
                AppLocalizations(context.read<LanguageCubit>().state.locale)
                    .translate(LocalizationKeys.settings),
                textAlign: TextAlign.left,
                style: textStyles.titleTextStyle,
              ),
              onTap: () {
                BlocProvider.of<NavigationBloc>(context)
                    .add(GoToPageSettingEvent(title: "setting"));
                Navigator.pop(context);
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: .4,
            ),
            ListTile(
              leading: Icon(Icons.settings, color: themeState.iconColor),
              title: Text(
                AppLocalizations(context.read<LanguageCubit>().state.locale)
                    .translate(LocalizationKeys.language),
                textAlign: TextAlign.left,
                style: textStyles.titleTextStyle,
              ),
              onTap: () {
                BlocProvider.of<NavigationBloc>(context)
                    .add(GoToPageLanguageEvent());
                Navigator.pop(context);
                /*   AppLocalizations(context.read<LanguageCubit>().state.locale)
                .translate(LocalizationKeys.sHeader),*/
                /*   BlocProvider.of<LanguageCubit>(context).switchToEnglish();
                BlocProvider.of<LanguageCubit>(context).switchToGerman();*/
                //   BlocProvider.of<LanguageCubit>(context).switchToHindi();
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: .4,
            ),
            ListTile(
              leading: Icon(Icons.logout, color: themeState.iconColor),
              title: Text(
                AppLocalizations(context.read<LanguageCubit>().state.locale)
                    .translate(LocalizationKeys.Logout),
                textAlign: TextAlign.left,
                style: textStyles.titleTextStyle,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
