import 'package:flutter/material.dart';
import 'package:harry_potter/data/hogwarts_data.dart';
import 'package:harry_potter/gen/fonts.gen.dart';
import 'package:harry_potter/screens/splash.dart';
import 'package:harry_potter/styles/app_styles.dart';
import 'package:provider/provider.dart';

import 'data/preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => HogwartsData()),
        ChangeNotifierProvider(create: (BuildContext context) => Preferences()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppStyles.saffron),
            useMaterial3: true,
            fontFamily: FontFamily.montserrat,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppStyles.saffron,
              centerTitle: true,
            )),
        home: const Splash(),
      ),
    );
  }
}
