import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/book/book_bloc.dart';
import '../../../../style/style.dart';
import 'widgets.dart';

void createBookModal(BuildContext context, Size size) {
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
                    'Registrar libro',
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
                            .add(NewBookTitle(value)),
                        label: 'Titulo',
                        pass: true,
                      ),
                      SearchBook(
                        size: size,
                        onChanged: (value) => BlocProvider.of<BookBloc>(context)
                            .add(NewBookAutor(value)),
                        label: 'Autor',
                        pass: true,
                      ),
                      CreateButton(
                          size: size,
                          onPressed: () {
                            if (!(state.loadingCreate ||
                                state.newBookTitle.isEmpty ||
                                state.newBookAutor.isEmpty)) {
                              BlocProvider.of<BookBloc>(context)
                                  .add(const CreateBook());
                            }
                          }),
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
