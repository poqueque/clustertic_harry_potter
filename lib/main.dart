import 'package:flutter/material.dart';
import 'package:harry_potter/data/hogwarts_data.dart';
import 'package:provider/provider.dart';

import 'data/preferences.dart';
import 'screens/character_list.dart';

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
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Montserrat',
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.purple.shade200,
              foregroundColor: Colors.white,
              centerTitle: true,
            )),
        home: const CharacterList(),
      ),
    );
  }
}
