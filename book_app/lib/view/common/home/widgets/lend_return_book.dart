import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/book/book_bloc.dart';
import '../../../../style/style.dart';
import 'search_book.dart';

void lendBookModal(BuildContext context, Size size) {
  var bloc = BlocProvider.of<BookBloc>(context);
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
                vertical: size.height * 0.3, horizontal: 30),
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
                  const Text(
                    'Prestar libro',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.textColor,
                    ),
                  ),
                  Column(
                    children: [
                      SearchBook(
                        size: size,
                        onChanged: (value) => BlocProvider.of<BookBloc>(context)
                            .add(LendUser(int.parse(value))),
                        label: 'id de usuario',
                        pass: true,
                        format: true,
                      ),
                      SearchBook(
                        size: size,
                        onChanged: (value) => BlocProvider.of<BookBloc>(context)
                            .add(LendBookId(int.parse(value))),
                        label: 'id de libro',
                        pass: true,
                        format: true,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (state.lendUserId != 0 &&
                              state.lendBookId != 0 &&
                              !state.loadingLend) {
                            BlocProvider.of<BookBloc>(context)
                                .add(const LendBook());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: state.loadingLend ||
                                        state.lendBookId == 0 ||
                                        state.lendUserId == 0
                                    ? ColorPalette.unFocused
                                    : ColorPalette.primary,
                                borderRadius: BorderRadius.circular(23)),
                            child: Center(
                              child: state.loadingLend
                                  ? const SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : const Text(
                                      'Registrar',
                                      style: TextStyle(
                                        color: ColorPalette.background,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}

void returnBookModal(BuildContext context, Size size) {
  var bloc = BlocProvider.of<BookBloc>(context);
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
                vertical: size.height * 0.3, horizontal: 30),
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
                  const Text(
                    'Devolver libro',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.textColor,
                    ),
                  ),
                  Column(
                    children: [
                      SearchBook(
                        size: size,
                        onChanged: (value) => BlocProvider.of<BookBloc>(context)
                            .add(LendUser(int.parse(value))),
                        label: 'id de usuario',
                        pass: true,
                        format: true,
                      ),
                      SearchBook(
                        size: size,
                        onChanged: (value) => BlocProvider.of<BookBloc>(context)
                            .add(LendBookId(int.parse(value))),
                        label: 'id de libro',
                        pass: true,
                        format: true,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (state.lendUserId != 0 &&
                              state.lendBookId != 0 &&
                              !state.loadingReturn) {
                            BlocProvider.of<BookBloc>(context)
                                .add(const ReturnBook());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: state.loadingReturn ||
                                        state.lendBookId == 0 ||
                                        state.lendUserId == 0
                                    ? ColorPalette.unFocused
                                    : ColorPalette.primary,
                                borderRadius: BorderRadius.circular(23)),
                            child: Center(
                              child: state.loadingReturn
                                  ? const SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : const Text(
                                      'Registrar',
                                      style: TextStyle(
                                        color: ColorPalette.background,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
