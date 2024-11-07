import 'package:flutter/material.dart';

import 'package:goproapp/router.dart';

void main() {
  runApp(const SurveyApp());
}

class SurveyApp extends StatelessWidget {
  const SurveyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Survey App',
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
