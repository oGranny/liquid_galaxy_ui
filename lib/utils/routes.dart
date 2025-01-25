import 'package:flutter/material.dart';
import 'package:lg_ui_task/pages/gemini.dart';
import 'package:lg_ui_task/pages/gemini_logo.dart';
import 'package:lg_ui_task/pages/google_voice.dart';
import 'package:lg_ui_task/pages/animated_navbar.dart';
import 'package:lg_ui_task/pages/animated_tabbar.dart';
import 'package:lg_ui_task/pages/progress_page.dart';

final routes = <String, WidgetBuilder>{
  '/progress': (context) => const ProgressPage(),
  '/navbar': (context) => const AnimatedBottomNavbar(),
  '/voice': (context) => const AnimatedBarPage(),
  '/tabbar': (context) => const AnimatedTabbar(),
  '/gemini': (context) => const Gemini(),
};
