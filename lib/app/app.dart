// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:cleanarchmvvm/presentation/resources/routes_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key); // Default constructor

  MyApp._internal(); // Private named constructor

  static final MyApp instance = MyApp._internal(); // Singleton instance

  factory MyApp() {
    return instance;
  } // Factory method to populate the singleton instance

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
