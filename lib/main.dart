// main.dart
import 'package:bmi_calc/theme/theme.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

enum Gender {
  male,
  female,
}

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: BmiTheme.lightTheme,
      darkTheme: BmiTheme.darkTheme,
      home: const InputPage(),
    );
  }
}
