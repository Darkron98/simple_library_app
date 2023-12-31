import 'package:book_app/view/common/home/home.dart';
import 'package:book_app/view/common/login/login.dart';
import 'package:book_app/view/common/register/register.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      'login': (context) => Login(),
      'home': (context) => const Home(),
      'register': (context) => const RegisterForm(),
    };
