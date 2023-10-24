import 'package:book_app/bloc/book/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/auth/auth_bloc.dart';
import '../../../../style/style.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.size,
    required this.onPressed,
  });
  final Size size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current.success || current.failure,
      listener: (context, state) {
        if (state.success) {
          BlocProvider.of<AuthBloc>(context).add(const Restore());
          BlocProvider.of<BookBloc>(context).add(const RestoreBooks());
          Navigator.of(context).pushNamed('home');
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                fixedSize: const Size.fromHeight(45),
                backgroundColor: state.loading ||
                        state.userName.isEmpty ||
                        state.pass.isEmpty
                    ? ColorPalette.unFocused
                    : ColorPalette.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: state.loading ? null : onPressed,
              child: state.loading
                  ? const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                  : const Text(
                      'Ingresar',
                      style: TextStyle(color: ColorPalette.textLightColor),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
