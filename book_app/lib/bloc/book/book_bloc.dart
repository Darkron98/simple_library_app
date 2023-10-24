import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:book_app/core/services/book_services.dart';
import 'package:equatable/equatable.dart';

import '../../core/model/book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(const BookState()) {
    on<SearchByTitle>((event, emit) {
      emit(state.copyWith(filter: false));
    });
    on<SearchByAutor>((event, emit) {
      emit(state.copyWith(filter: true));
    });

    on<SearchData>(
      (event, emit) => emit(
        state.copyWith(searchData: event.searchData),
      ),
    );

    on<SearchBooks>((event, emit) async {
      emit(state.copyWith(loadingBooks: true));
      List<Book> books =
          await BookService().getBooks(state.searchData, state.filter);
      emit(state.copyWith(books: books, loadingBooks: false));
    });

    on<RestoreBooks>((event, emit) => emit(const BookState()));

    on<NewBookTitle>((event, emit) =>
        emit(state.copyWith(newBookTitle: event.newBookTitle)));

    on<NewBookAutor>((event, emit) =>
        emit(state.copyWith(newBookAutor: event.newBookAutor)));

    on<CreateBook>(
      (event, emit) async {
        emit(state.copyWith(loadingCreate: true));
        int resp = await BookService()
            .createBook(state.newBookTitle, state.newBookAutor);
        emit(state.copyWith(
            loadingCreate: false,
            newBookAutor: resp == 200 ? '' : null,
            newBookTitle: resp == 200 ? '' : null));
      },
    );

    on<DeleteBook>(
      (event, emit) async {
        emit(state.copyWith(
            loadingDelete: true,
            loadingBooks: true,
            deleteBookId: event.bookId));
        int resp = await BookService().deleteBook(event.bookId);
        List<Book> books =
            await BookService().getBooks(state.searchData, state.filter);
        emit(state.copyWith(
            books: books,
            loadingDelete: false,
            loadingBooks: false,
            deleteBookId: 0));
      },
    );

    on<LendBook>((event, emit) async {
      emit(state.copyWith(loadingLend: true));
      int resp =
          await BookService().lendBook(state.lendBookId, state.lendUserId);
      emit(state.copyWith(
          lendBookId: resp == 200 ? 0 : null,
          lendUserId: resp == 200 ? 0 : null,
          loadingLend: false));
    });

    on<ReturnBook>((event, emit) async {
      emit(state.copyWith(loadingReturn: true));
      int resp =
          await BookService().returnBook(state.lendBookId, state.lendUserId);
      emit(state.copyWith(
          lendBookId: resp == 200 ? 0 : null,
          lendUserId: resp == 200 ? 0 : null,
          loadingReturn: false));
    });

    on<LendBookId>((event, emit) => emit(
          state.copyWith(lendBookId: event.bookId),
        ));

    on<LendUser>((event, emit) => emit(
          state.copyWith(lendUserId: event.userId),
        ));
  }
}
