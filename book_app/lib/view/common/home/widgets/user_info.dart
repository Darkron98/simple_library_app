import 'package:book_app/core/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/book/book_bloc.dart';
import '../../../../style/style.dart';

void userInfoModal(BuildContext context, Size size) {
  var bloc = BlocProvider.of<BookBloc>(context);
  Preferences preferences = Preferences();
  TextStyle style = TextStyle(color: ColorPalette.greyText, fontSize: 16);
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
                vertical: size.height * 0.32, horizontal: size.width * 0.25),
            child: Container(
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
                      const SizedBox(height: 10),
                      Text(preferences.user, style: style),
                      Text('ID - ${preferences.userId}', style: style),
                    ],
                  ),
                  Text(preferences.name, style: style, maxLines: 3),
                  SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
