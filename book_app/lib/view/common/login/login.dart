import 'package:book_app/style/color/palette.dart';
import 'package:book_app/view/common/login/widgets/login_button.dart';
import 'package:book_app/view/common/login/widgets/login_textfield.dart';
import 'package:book_app/view/common/login/widgets/register_label.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/book/book_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: LoginForm(size: size, pageController: _pageController),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.size,
    required PageController pageController,
  }) : _pageController = pageController;

  final Size size;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image(
              width: size.width * 0.17,
              image: const AssetImage('assets/owl.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'OWL Library',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: ColorPalette.textColor,
              ),
            ),
          ],
        ),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              LoginFormField(
                size: size,
                onChanged: (value) {
                  BlocProvider.of<AuthBloc>(context).add(TypeUser(value));
                },
                pass: false,
                label: 'Usuario',
              ),
              LoginFormField(
                size: size,
                onChanged: (value) {
                  BlocProvider.of<AuthBloc>(context).add(TypePass(value));
                },
                pass: true,
                label: 'Contraseña',
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return LoginButton(
                    size: size,
                    onPressed: state.loading ||
                            state.userName.isEmpty ||
                            state.pass.isEmpty
                        ? null
                        : () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(const Submitted());
                          },
                  );
                },
              ),
            ],
          ),
        ),
        RegisterLabel(
          pageController: _pageController,
        ),
        const Text(
          'Version 1.0',
          style: TextStyle(color: ColorPalette.greyText),
        ),
      ],
    );
  }
}
