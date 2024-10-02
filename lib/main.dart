import 'package:flutter/material.dart';
import 'package:multiproj/Views/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiproj/provider/language_change.dart';
import 'package:multiproj/stripe/strihome.dart';
import 'package:multiproj/stripe/stripe_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StripeServices.init();
  final prefs = await SharedPreferences.getInstance();
  final String languageCode = prefs.getString('language_code') ?? '';
  runApp(MyApp(locale: languageCode));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChangeController()),
      ],
      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          if (provider.applocal == null) {
            if (locale.isEmpty) {
              provider.ChangeLanguage(Locale('en'));
            } else {
              provider.ChangeLanguage(Locale(locale));
            }
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            locale: locale == ''
                ? Locale('en')
                : provider.applocal == null
                    ? Locale(locale)
                    : Provider.of<LanguageChangeController>(context).applocal,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              Locale('en'),
              Locale('es'),
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
