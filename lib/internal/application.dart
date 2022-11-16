import 'package:calendar_test/core/ui/app_theme.dart';
import 'package:calendar_test/demo/demo_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DemoPage(),
      theme: appThemeData,
    );
  }
}
