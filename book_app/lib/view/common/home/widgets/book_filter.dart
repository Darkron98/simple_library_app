import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/book/book_bloc.dart';
import '../../../../style/style.dart';

class BookFilter extends StatelessWidget {
  const BookFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Row(
              children: [
                GestureDetector(
                  onTap: () => BlocProvider.of<BookBloc>(context)
                      .add(const SearchByTitle()),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      color: !state.filter
                          ? ColorPalette.primary
                          : ColorPalette.inactive,
                    ),
                    child: Center(
                      child: Text(
                        'Titulo',
                        style: TextStyle(
                          color: !state.filter
                              ? ColorPalette.background
                              : ColorPalette.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => BlocProvider.of<BookBloc>(context)
                      .add(const SearchByAutor()),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: state.filter
                          ? ColorPalette.primary
                          : ColorPalette.inactive,
                    ),
                    child: Center(
                      child: Text(
                        'Autor',
                        style: TextStyle(
                          color: state.filter
                              ? ColorPalette.background
                              : ColorPalette.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(),
          ],
        );
      },
    );
  }
}
