import 'package:book_app/core/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/register/register_bloc.dart';
import '../../../../style/style.dart';

class UserRegisterButton extends StatelessWidget {
  const UserRegisterButton(
      {super.key, required this.size, required this.onPressed});
  final Size size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 25),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(45),
                backgroundColor: state.validateForm || state.loading
                    ? ColorPalette.unFocused
                    : ColorPalette.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: state.validateForm || state.loading ? null : onPressed,
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
                      'Registrarse',
                      style: TextStyle(
                        color: ColorPalette.background,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
