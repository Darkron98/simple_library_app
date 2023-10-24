part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class SearchByTitle extends BookEvent {
  const SearchByTitle();
  @override
  List<Object> get props => [];
}

class SearchByAutor extends BookEvent {
  const SearchByAutor();
  @override
  List<Object> get props => [];
}

class SearchData extends BookEvent {
  const SearchData(this.searchData);
  final String searchData;
  @override
  List<Object> get props => [searchData];
}

class SearchBooks extends BookEvent {
  const SearchBooks();
  @override
  List<Object> get props => [];
}

class RestoreBooks extends BookEvent {
  const RestoreBooks();
  @override
  List<Object> get props => [];
}

class NewBookTitle extends BookEvent {
  const NewBookTitle(this.newBookTitle);
  final String newBookTitle;
  @override
  List<Object> get props => [newBookTitle];
}

class NewBookAutor extends BookEvent {
  const NewBookAutor(this.newBookAutor);
  final String newBookAutor;
  @override
  List<Object> get props => [newBookAutor];
}

class CreateBook extends BookEvent {
  const CreateBook();
  @override
  List<Object> get props => [];
}

class DeleteBook extends BookEvent {
  const DeleteBook(this.bookId);
  final int bookId;
  @override
  List<Object> get props => [bookId];
}

class LendBook extends BookEvent {
  const LendBook();

  @override
  List<Object> get props => [];
}

class LendUser extends BookEvent {
  const LendUser(this.userId);

  final int userId;
  @override
  List<Object> get props => [userId];
}

class LendBookId extends BookEvent {
  const LendBookId(this.bookId);

  final int bookId;
  @override
  List<Object> get props => [bookId];
}

class ReturnBook extends BookEvent {
  const ReturnBook();
  @override
  List<Object> get props => [];
}
