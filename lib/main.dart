import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(RituCycleApp());
}

class RituCycleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RituCycle',
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}
