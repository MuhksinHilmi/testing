import 'package:flutter/material.dart';
import 'package:note/core/di/injector.dart';
import 'package:note/features/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const App());
}
