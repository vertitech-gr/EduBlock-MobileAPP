import 'package:edublock/constants/app_theme.dart';
import 'package:edublock/constants/strings.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/flavors/main_common.dart';
import 'package:edublock/presentation/auth/login/login.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/home.dart';
import 'package:edublock/presentation/home/store/language/language_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:edublock/utils/routes/app_route_config.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final LanguageStore _languageStore = getIt<LanguageStore>();
  final UserStore _userStore = getIt<UserStore>();
  final ThemeStore _themeStore = getIt<ThemeStore>();

  @override
  Widget build(BuildContext context,ref) {
     final config  = ref.read(flavorConfigProvider);

    return Observer(
      builder: (context) {
        print('is user logged in ${_userStore.isLoggedIn}');
        SnackBar(content: Text('is user logged in ${_userStore.isLoggedIn}'),);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: _themeStore.darkMode
              ? AppThemeData.darkThemeData
              : AppThemeData.lightThemeData,
          routes: Routes.routes,
          locale: Locale(_languageStore.locale),
          supportedLocales: _languageStore.supportedLanguages
              .map((language) => Locale(language.locale, language.code))
              .toList(),
          localizationsDelegates: const [
            // A class which loads the translations from JSON files
            AppLocalizations.delegate,
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
            // Built-in localization of basic text for Cupertino widgets
            GlobalCupertinoLocalizations.delegate,
          ],
          home: _userStore.isLoggedIn ? HomeScreen() : LoginScreen(),
          // home: SplashScreen(),
        );
      },
    );
  }
}
