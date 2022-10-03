import 'package:cleanarchmvvm/app/di.dart';
import 'package:cleanarchmvvm/presentation/base/cubit/base_cubit.dart';
import 'package:cleanarchmvvm/presentation/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/resources/routes_manager.dart';
import 'presentation/resources/theme_manager.dart';

/*void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Fixes a crash when initializing SharedPrefs before running the app
  await initAppModule();
  runApp(MyApp());
}*/
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Fixes a crash when initializing SharedPrefs before running the app
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
