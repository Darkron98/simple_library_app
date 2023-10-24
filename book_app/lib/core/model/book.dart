class Book {
  Book({
    required this.id,
    required this.title,
    required this.autor,
  });

  final int id;
  final String title;
  final String autor;

  Book copyWith({
    int? id,
    String? title,
    String? autor,
  }) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        autor: autor ?? this.autor,
      );
}
