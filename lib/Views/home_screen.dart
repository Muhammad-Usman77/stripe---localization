import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiproj/provider/language_change.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, spanish }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Locatizations'),
        actions: [
          Consumer<LanguageChangeController>(
              builder: (context, provider, child) {
            return PopupMenuButton(
              onSelected: (Language item) {
                if (Language.english.name == item.name) {
                  provider.ChangeLanguage(Locale('en'));
                } else {
                  provider.ChangeLanguage(Locale('es'));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                const PopupMenuItem(
                  value: Language.english,
                  child: Text('Englis'),
                ),
                const PopupMenuItem(
                  value: Language.spanish,
                  child: Text('Spanish'),
                ),
              ],
            );
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.helloWorld,
              style: TextStyle(fontSize: 29),
            ),
          ],
        ),
      ),
    );
  }
}
