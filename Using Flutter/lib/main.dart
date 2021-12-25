import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_generator/homepage.dart';
import 'package:password_generator/theme.dart';
import 'package:password_generator/themeservices.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: Themes.light,
    darkTheme: Themes.dark,
    themeMode: ThemeService().theme,

      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Icon(CupertinoIcons.gear_big),
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.grey[600]!,
        )
    );
  }

 
}