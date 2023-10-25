import 'package:book_app/bloc/bloc.dart';
import 'package:book_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register/register_bloc.dart';
import 'style/style.dart';

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
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OWL',
        routes: getRoutes(),
        initialRoute: 'login',
        theme: ThemeData(
          primaryColor: ColorPalette.primary,
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: ColorPalette.primary,
          ),
        ),
      ),
    );
  }
}
