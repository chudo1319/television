import 'package:flutter/material.dart';

import 'common/styles/themes/app_theme_data.dart';

void main() {
  runApp(const Television());
}

class Television extends StatelessWidget {
  const Television({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
    );
  }
}
