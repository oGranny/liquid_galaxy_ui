import 'package:flutter/material.dart';
import 'package:lg_ui_task/pages/home_screen.dart';
import 'package:lg_ui_task/services/lg_service.dart';
import 'package:lg_ui_task/utils/routes.dart';
import 'package:lg_ui_task/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<LgService>(
          create: (_) => LgService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: const MainPage(),
    );
  }
}
