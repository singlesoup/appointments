import 'package:appointments/src/home/screens/homescreen.dart';
import 'package:appointments/src/theme/text_theme.dart';
import 'package:flutter/material.dart' show Brightness, MaterialApp, ThemeData;
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointments',
      theme: ThemeData(
        textTheme: hhTextTheme,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
