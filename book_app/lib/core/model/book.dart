class Book {
  Book({
    required this.id,
    required this.title,
    required this.autor,
    required this.statusCode,
  });

  final int id;
  final String title;
  final String autor;
  final int statusCode;

  Book copyWith({
    int? id,
    String? title,
    String? autor,
    int? statusCode,
  }) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        autor: autor ?? this.autor,
        statusCode: statusCode ?? this.statusCode,
      );
}
