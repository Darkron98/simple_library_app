import 'package:book_app/core/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/book/book_bloc.dart';
import '../../../../style/style.dart';

void userInfoModal(BuildContext context, Size size) {
  var bloc = BlocProvider.of<BookBloc>(context);
  Preferences preferences = Preferences();
  TextStyle style = const TextStyle(color: ColorPalette.greyText, fontSize: 16);
  TextStyle style2 = const TextStyle(
    color: ColorPalette.greyText,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (context) => BlocProvider.value(
      value: bloc,
      child: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.32 * 0, horizontal: 100 * 0),
            child: Center(
              child: Container(
                width: 220,
                height: 260,
                decoration: BoxDecoration(
                  color: ColorPalette.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        child: Container(
                          width: 50,
                          height: 4,
                          decoration: BoxDecoration(
                              color: ColorPalette.inactive,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Image(
                          width: 50,
                          image: AssetImage('assets/owl.png'),
                        ),
                        const SizedBox(height: 7.5),
                        Text(
                          preferences.rol == 2 ? 'Bibliotecario' : 'Lector',
                          style: style2,
                        ),
                        const SizedBox(height: 10),
                        Text(preferences.user, style: style),
                        Text('ID - ${preferences.userId}', style: style),
                      ],
                    ),
                    Column(
                      children: [
                        Text(preferences.name, style: style),
                        Text(preferences.lastName, style: style),
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
