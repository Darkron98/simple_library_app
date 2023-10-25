import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/auth/auth_bloc.dart';
import '../../../../style/style.dart';

class RegisterLabel extends StatelessWidget {
  const RegisterLabel({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'No tienes cuenta? ',
          style: TextStyle(color: ColorPalette.textColor),
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'register');
              //BlocProvider.of<AuthBloc>(context).add(const GoRegister(1));
            },
            child: const Text(
              'Registrate!',
              style: TextStyle(
                color: ColorPalette.primary,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
