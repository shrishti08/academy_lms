import 'dart:io';

import 'package:academy_lms/Auth/SignIn/phone_auth.dart';
import 'package:academy_lms/Auth/SignIn/sign_in.dart';
import 'package:academy_lms/Auth/SignUp/sign_up.dart';
import 'package:academy_lms/Home/home.dart';
import 'package:academy_lms/Locale/change_language.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Others/user_experience.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'Routes/routes.dart';
import 'Theme/styles.dart';
import 'language_cubit.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (_, locale) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('ar'),
              const Locale('pt'),
              const Locale('fr'),
              const Locale('id'),
              const Locale('es'),
              const Locale('tk'),
              const Locale('it'),
              const Locale('sw'),
            ],
            locale: locale,
            theme: appTheme,
            // home: SelectLanguage(),
            // home: HomePage(),
            // home: PhoneAuthPage(),
            home: SignInPage(),
            routes: PageRoutes().routes(),
          );
        },
      ),
    );
  }
}
