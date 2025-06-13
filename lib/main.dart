import 'package:flutter/material.dart';
import 'package:todo_app2/ui/screens/home/home.dart';

import 'package:todo_app2/ui/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.dark,
      routes: {
        Home.routeName:(_)=>Home()
      },
      initialRoute: Home.routeName,
    );
  }
}


