import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/them/ThemeCubit.dart';

import '../AppLocalizations.dart';

import '../custom_widget/LocalizationKeys.dart';
import '../utils/text_styles.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final textStyles = TextStyles(themeState);
    return Scaffold(
      backgroundColor: themeState.backgroundColor,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<LanguageCubit>(context)
                            .switchToEnglish();
                      },
                      child: Card(
                        color: themeState.SecondaryColor,
                        shadowColor: themeState.textColor,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 70,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: themeState.backgroundColor,
                                  child: Text("E",style: textStyles.titleTextStyle,),
                                ),
                                Text(
                                  AppLocalizations(context
                                          .read<LanguageCubit>()
                                          .state
                                          .locale)
                                      .translate(LocalizationKeys.English),
                                  textAlign: TextAlign.left,
                                  style: textStyles.titleTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<LanguageCubit>(context).switchToHindi();
                      },
                      child: Card(
                        color: themeState.SecondaryColor,
                        shadowColor: themeState.textColor,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 70,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: themeState.backgroundColor,
                                  child: Text("HI",style: textStyles.titleTextStyle,),
                                ),
                                Text(
                                  AppLocalizations(context
                                          .read<LanguageCubit>()
                                          .state
                                          .locale)
                                      .translate(LocalizationKeys.Hindi),
                                  textAlign: TextAlign.left,
                                  style: textStyles.titleTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<LanguageCubit>(context)
                            .switchToGerman();
                      },
                      child: Card(
                        surfaceTintColor: Colors.deepPurpleAccent,
                        color: themeState.SecondaryColor,
                        shadowColor: themeState.textColor,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 70,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: themeState.backgroundColor,
                                  child: Text("GE",style: textStyles.titleTextStyle,),
                                ),
                                Text(
                                  AppLocalizations(context
                                          .read<LanguageCubit>()
                                          .state
                                          .locale)
                                      .translate(LocalizationKeys.German),
                                  textAlign: TextAlign.left,
                                  style: textStyles.titleTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),


                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<LanguageCubit>(context)
                            .switchToPunjabi();
                      },
                      child: Card(
                        color: themeState.SecondaryColor,
                        shadowColor: themeState.textColor,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 70,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: themeState.backgroundColor,
                                  child: Text("P",style: textStyles.titleTextStyle,),
                                ),
                                Text(
                                  AppLocalizations(context
                                          .read<LanguageCubit>()
                                          .state
                                          .locale)
                                      .translate(LocalizationKeys.punjabi),
                                  textAlign: TextAlign.left,
                                  style: textStyles.titleTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<LanguageCubit>(context).switchToGujrati();
                      },
                      child: Card(
                        color: themeState.SecondaryColor,
                        shadowColor: themeState.textColor,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 70,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: themeState.backgroundColor,
                                  child: Text("G",style: textStyles.titleTextStyle,),
                                ),
                                Text(
                                  AppLocalizations(context
                                          .read<LanguageCubit>()
                                          .state
                                          .locale)
                                      .translate(LocalizationKeys.Gujarati),
                                  textAlign: TextAlign.left,
                                  style: textStyles.titleTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              )
            ],
          )),
    );
  }
}
