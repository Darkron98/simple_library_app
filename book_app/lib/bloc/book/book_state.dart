part of 'book_bloc.dart';

class BookState extends Equatable {
  const BookState({
    this.filter = false,
    this.loadingBooks = false,
    this.loadingLend = false,
    this.loadingReturn = false,
    this.loadingCreate = false,
    this.loadingDelete = false,
    this.searchData = '',
    this.newBookTitle = '',
    this.newBookAutor = '',
    this.lendUserId = 0,
    this.lendBookId = 0,
    this.deleteBookId = 0,
    this.books = const [],
    this.success = false,
  });

  final bool filter;
  final bool loadingBooks;
  final bool loadingLend;
  final bool loadingReturn;
  final bool loadingCreate;
  final bool loadingDelete;
  final bool success;
  final String searchData;
  final String newBookTitle;
  final String newBookAutor;
  final int lendUserId;
  final int lendBookId;
  final int deleteBookId;
  final List<Book> books;

  BookState copyWith({
    bool? filter,
    bool? loadingBooks,
    bool? loadingLend,
    bool? loadingReturn,
    bool? loadingCreate,
    bool? loadingDelete,
    bool? success,
    String? searchData,
    String? newBookAutor,
    String? newBookTitle,
    int? lendUserId,
    int? lendBookId,
    int? deleteBookId,
    List<Book>? books,
  }) =>
      BookState(
        filter: filter ?? this.filter,
        loadingBooks: loadingBooks ?? this.loadingBooks,
        loadingLend: loadingLend ?? this.loadingLend,
        loadingReturn: loadingReturn ?? this.loadingReturn,
        loadingCreate: loadingCreate ?? this.loadingCreate,
        loadingDelete: loadingDelete ?? this.loadingDelete,
        success: success ?? this.success,
        searchData: searchData ?? this.searchData,
        books: books ?? this.books,
        newBookAutor: newBookAutor ?? this.newBookAutor,
        newBookTitle: newBookTitle ?? this.newBookTitle,
        lendBookId: lendBookId ?? this.lendBookId,
        lendUserId: lendUserId ?? this.lendUserId,
        deleteBookId: deleteBookId ?? this.deleteBookId,
      );

  @override
  List<Object> get props => [
        filter,
        loadingBooks,
        loadingLend,
        loadingReturn,
        loadingCreate,
        loadingDelete,
        success,
        searchData,
        newBookAutor,
        newBookTitle,
        books,
        lendBookId,
        lendUserId,
        deleteBookId,
      ];
}
