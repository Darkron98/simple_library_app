import 'package:book_app/view/common/register/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';

import '../../../bloc/register/register_bloc.dart';
import '../../../style/color/palette.dart';
import 'widgets/register_form.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocListener<RegisterBloc, RegisterState>(
            listenWhen: (previous, current) => current.success,
            listener: (context, state) {
              if (state.success) {
                BlocProvider.of<RegisterBloc>(context)
                    .add(const RestoreRegister());
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(
                          size: size,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Ingresa tus datos',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: ColorPalette.textColor,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            RegisterFormField(
                              onChanged: (value) {
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(TypeName(value));
                              },
                              size: size,
                              label: 'Nombre',
                            ),
                            RegisterFormField(
                              onChanged: (value) =>
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(TypeLastName(value)),
                              size: size,
                              label: 'Apellidos',
                            ),
                            RegisterFormField(
                              onChanged: (value) =>
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(TypeUserName(value)),
                              size: size,
                              label: 'Nombre de usuario',
                            ),
                            RegisterFormField(
                              onChanged: (value) =>
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(TypePassword(value)),
                              size: size,
                              pass: true,
                              label: 'Contraseña',
                            ),
                            RegisterFormField(
                                onChanged: (value) =>
                                    BlocProvider.of<RegisterBloc>(context)
                                        .add(ConfirmationPass(value)),
                                size: size,
                                pass: true,
                                label: 'Confirmar Contraseña'),
                            RegisterFormField(
                              onChanged: (value) =>
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(Rol(int.parse(value))),
                              size: size,
                              label: 'Rol : 1 - 2',
                              format: true,
                            ),
                            UserRegisterButton(
                              size: size,
                              onPressed: () =>
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(const Register()),
                            )
                          ],
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: ColorPalette.inactive,
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.only(right: 0),
                child: Icon(
                  Remix.arrow_left_s_line,
                  color: ColorPalette.primary,
                ),
              ),
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
