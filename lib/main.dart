import 'package:flutter/material.dart';
import 'package:news_app/Core/Style/theme.dart';
import 'package:news_app/View/Home/home_view.dart';
import 'package:news_app/View/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.styleTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeView.routeName: (context) => HomeView(),
      },
    );
  }
}
