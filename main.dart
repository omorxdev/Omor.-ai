import 'package:flutter/material.dart';
import 'screens/app_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DeveloperOmorApp());
}

class DeveloperOmorApp extends StatelessWidget {
  const DeveloperOmorApp({super.key});

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF8B7CFF);
    return MaterialApp(
      title: 'DEVELOPER OMOR AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090B14),
        colorScheme: const ColorScheme.dark(
          primary: accent,
          secondary: Color(0xFF55D6BE),
          surface: Color(0xFF141827),
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF171C2B),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const AppShell(),
    );
  }
}
