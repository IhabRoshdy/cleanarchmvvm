import 'package:cleanarchmvvm/app/di.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Fixes a crash when initializing SharedPrefs before running the app
  await initAppModule();
  runApp(MyApp());
}
