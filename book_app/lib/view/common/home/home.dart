import 'package:book_app/core/preferences/preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';

import '../../../bloc/book/book_bloc.dart';
import '../../../style/style.dart';
import 'widgets/lend_return_book.dart';
import 'widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Preferences preferences = Preferences();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  BookAppBar(size: size),
                  SizedBox(height: size.height * 0.15),
                  Column(
                    children: [
                      BookTextField(
                        size: size,
                        onChanged: (value) => BlocProvider.of<BookBloc>(context)
                            .add(SearchData(value)),
                        label: 'Buscar',
                      ),
                      const BookFilter(),
                      const SizedBox(height: 50, child: Divider()),
                      preferences.rol == 2
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    returnBookModal(context, size);
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 35,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: ColorPalette.primary,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Text(
                                        'Devolución',
                                        style: TextStyle(
                                          color: ColorPalette.background,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    lendBookModal(context, size);
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 35,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: ColorPalette.primary,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Text(
                                        'Prestamo',
                                        style: TextStyle(
                                          color: ColorPalette.background,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      BookList(size: size),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: preferences.rol == 2
            ? Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: ColorPalette.primary,
                  onPressed: () {
                    createBookModal(context, size);
                  },
                  child: const Icon(Remix.add_line),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
