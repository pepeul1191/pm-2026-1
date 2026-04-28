// main.dart
import 'package:biblio/pages/home/home_page.dart';
import 'package:biblio/pages/profile/profile_page.dart';
import 'package:biblio/pages/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import './configs/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TextTheme baseTextTheme = Typography.material2021().englishLike;
    final MaterialTheme materialTheme = MaterialTheme(baseTextTheme);
    final colors = Theme.of(context).colorScheme;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    ThemeData myTheme;

    if(isDarkMode){
      myTheme = materialTheme.dark();
    }else{
      myTheme = materialTheme.light();
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
