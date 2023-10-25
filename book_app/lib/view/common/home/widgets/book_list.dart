import 'package:book_app/core/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';

import '../../../../bloc/book/book_bloc.dart';
import '../../../../style/style.dart';

class BookList extends StatelessWidget {
  const BookList({
    super.key,
    required this.size,
  });

  final Size size;
  @override
  Widget build(BuildContext context) {
    Preferences preferences = Preferences();
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        return state.books.isEmpty
            ? SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.2),
                  child: const Icon(
                    Remix.file_search_line,
                    size: 75,
                    color: ColorPalette.inactive,
                  ),
                ),
              )
            : Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Libros relacionados',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.textColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: size.height * 0.4,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.books.length,
                      itemBuilder: (context, i) => ListTile(
                        title: Text(state.books[i].title),
                        subtitle: Text(state.books[i].autor),
                        leading: Text(
                          state.books[i].id.toString(),
                          style: const TextStyle(color: ColorPalette.greyText),
                        ),
                        trailing: preferences.rol == 2
                            ? GestureDetector(
                                onTap: () {
                                  if (!state.loadingDelete) {
                                    BlocProvider.of<BookBloc>(context)
                                        .add(DeleteBook(state.books[i].id));
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: state.loadingDelete &&
                                          state.books[i].id ==
                                              state.deleteBookId
                                      ? const Padding(
                                          padding: EdgeInsets.all(0),
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color: ColorPalette.primary,
                                              strokeWidth: 2.5,
                                            ),
                                          ),
                                        )
                                      : const Icon(Remix.delete_bin_7_line),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
