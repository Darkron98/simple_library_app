// ignore_for_file: unused_local_variable

import 'package:book_app/core/preferences/preferences.dart';
import 'package:book_app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/services/services.dart';

// To Do: implementar prestamo

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final bookService = BookService();
  final authServices = AuthServices();
  final prefs = Preferences();
  await prefs.intialize();
  runApp(const MyApp());
}
