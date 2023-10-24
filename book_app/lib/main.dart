import 'package:book_app/bloc/auth/auth_bloc.dart';
import 'package:book_app/bloc/book/book_bloc.dart';
import 'package:book_app/core/preferences/preferences.dart';
import 'package:book_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// To Do: implementar prestamo

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final prefs = Preferences();
  await prefs.intialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => BookBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OWL',
        routes: getRoutes(),
        initialRoute: 'login',
      ),
    );
  }
}
