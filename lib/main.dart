import 'package:appointments/src/appoinments/provider/approinments_provider.dart';
import 'package:appointments/src/home/screens/homescreen.dart';
import 'package:appointments/src/theme/colors.dart';

import 'package:appointments/src/theme/text_theme.dart';
import 'package:flutter/material.dart' show Brightness, MaterialApp, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ApproinmentsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Appointments',
        theme: ThemeData(
          primaryColor: themeColor,
          scaffoldBackgroundColor: bgColor,
          textTheme: hhTextTheme,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
