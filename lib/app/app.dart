// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:cleanarchmvvm/app/di.dart';
import 'package:cleanarchmvvm/presentation/base/cubit/base_cubit.dart';
import 'package:cleanarchmvvm/presentation/login/cubit/login_cubit.dart';
import 'package:cleanarchmvvm/presentation/resources/routes_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key); // Default constructor

  MyApp._internal(); // Private named constructor

  static final MyApp myAppInstance = MyApp._internal(); // Singleton instance

  factory MyApp() {
    return myAppInstance;
  } // Factory method to populate the singleton instance

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BaseCubit>(create: (context) => instance<BaseCubit>()),
        BlocProvider<LoginCubit>(create: (context) => instance<LoginCubit>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationTheme(),
      ),
    );
  }
}
