import 'package:book_app/style/color/palette.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../bloc/register/register_bloc.dart';

Map<String, String> headers(String token) => {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

String dateParse(DateTime date) => "${date.year}/${date.month}/${date.day}";

bool validateUserRegister(RegisterState data) {
  return data.name.isEmpty ||
      data.lastName.isEmpty ||
      data.password.isEmpty ||
      data.confirmationPass.isEmpty ||
      data.userName.isEmpty ||
      (data.password != data.confirmationPass &&
          data.password.isNotEmpty &&
          data.confirmationPass.isNotEmpty) ||
      (data.rol != 1 && data.rol != 2);
}

bool isInt(String data) {
  try {
    int.parse(data);
    return true;
  } catch (e) {
    return false;
  }
}

void customSnackBar(BuildContext context,
    {required String message,
    String? subtittle,
    required IconData icon,
    required Color color,
    required Color iconColor,
    bool? success}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        elevation: 0,
        content: SafeArea(
          child: SizedBox(
            height: 100,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [color, iconColor])),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              message,
                              style: const TextStyle(
                                color: ColorPalette.background,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtittle != null
                                ? Text(
                                    subtittle,
                                    style: const TextStyle(
                                      color: ColorPalette.background,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 10,
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 50,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 15,
                  child: IconButton(
                    icon: const Icon(
                      Remix.close_fill,
                      size: 20,
                    ),
                    color: ColorPalette.background,
                    onPressed: () =>
                        ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                  ),
                ),
              ],
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 2,
          right: 2,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
      ),
    );
}
