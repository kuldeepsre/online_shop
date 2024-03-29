
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:online_shop/pages/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppLocalizations.dart';
import 'bloc/categores_bloc/categories_bloc.dart';
import 'bloc/navigation_bloc/navigation_bloc.dart';
import 'bloc/profile_bloc/profile_bloc.dart';
import 'bloc/setting_bloc/settings_bloc.dart';
import 'bloc/them/ThemeCubit.dart';
import 'bloc/view_more_bloc/view_more_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/config.dart';
import 'constants/urls.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load the stored theme preference
  final isDarkTheme = await _loadThemeFromStorage();
  final locale = await _loadLanguageFromStorage();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: 'AIzaSyDWuKliw6WbgUDUdReOjZgR7cJ6mVJOqI8',appId: '1:874929202331:android:6fbe46b179c1de9b84523e',messagingSenderId: '874929202331',projectId: 'petonline-3e617'));
  // Firebase Core setup
  /*  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/

  // Remote Config Setup
  await remoteConfig();
  //final bool updateRequired = await isUpdateRequired();
  print(AppUrls.backendBaseUrl);
  runApp(MyApp(isDarkTheme: isDarkTheme,  locale: locale,));
}
Future<bool> _loadThemeFromStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isDarkTheme') ?? false; // Default to light theme if not found
}

Future<Locale> _loadLanguageFromStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString('languageCode') ?? 'en'; // Default to English if not found
  final countryCode = prefs.getString('countryCode') ?? ''; // Default to empty string if not found
  return Locale(languageCode, countryCode);
}
class MyApp extends StatelessWidget {
  final bool isDarkTheme;
  final Locale locale;
  const MyApp({
    required this.isDarkTheme,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProfileBloc()),
        BlocProvider(create: (_) => SettingsBloc()),
        BlocProvider(create: (_) => CategoriesBloc()),
        BlocProvider(create: (_) => ViewMoreBloc()),
        BlocProvider(create: (_) => NavigationBloc()),
        BlocProvider(create: (_) => CategoriesBloc()..add(LoadCategories())),
        BlocProvider(create: (_) => ProductsBloc(0)),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(isDarkTheme: isDarkTheme),
        ),
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit(locale: locale)),

      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (themeContext, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (languageContext, languageState) {
              return MaterialApp(
                  title: 'Day Night Mode Example',
                  theme: themeState.themeData,
                  locale: languageState.locale,
                  localizationsDelegates: [
                    AppLocalizationsDelegate(languageState.locale),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en', 'US'),
                    Locale('hi', 'IN'),
                    Locale('de', 'DE'),
                    Locale('pa', 'IN'), // Punjabi
                    Locale('gu', 'IN'), // Gujarati
                  ],
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/',
                  routes: {
                    '/': (context) => DashboardScrreen(),
                      // '/languageScreen': (context) => LanguageScreen(),
                    // '/settings': (context) => SettingsScreen(),
                    // '/categories': (context) => CategoriesScreen(),
                    // '/viewMore': (context) => ViewMoreScreen(),
                  }
                  // home: MyHomePage(),
                  );
            },
          );
        },
      ),
    );
  }
}
