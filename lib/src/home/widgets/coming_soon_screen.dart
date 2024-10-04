import 'package:appointments/src/theme/colors.dart';
import 'package:appointments/src/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  final String title;

  const ComingSoonScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            title,
            style: hhTextTheme.headlineSmall!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        backgroundColor: bgColor,
      ),
      body: Center(
        child: Text(
          '$title - Coming Soon',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
