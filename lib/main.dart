// main.dart
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

    print('1 ++++++++++++++++++++++++++++++++');


    ThemeData myLightTheme;

    if(isDarkMode){
       myLightTheme = materialTheme.dark();
    }else{
       myLightTheme = materialTheme.light();
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Biblio App UL", 
            style: TextStyle(
                color: colors.primary
              ),
            ),
          backgroundColor: myLightTheme.colorScheme.tertiaryContainer
        ),
        body: Center(
          child: Text("hola mundo")
        ),
      ),
    );
  }
}
