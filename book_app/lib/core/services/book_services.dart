import 'dart:convert';

import 'package:book_app/core/logic/logic.dart';
import 'package:book_app/core/preferences/preferences.dart';
import 'package:dio/dio.dart';

import '../model/auth_response.dart';
import '../model/book.dart';

abstract class BookServiceInterface {
  Future<List<Book>> getBooks(String searchData, bool filter);
  Future<int> createBook(String title, String autor);
  Future<int> deleteBook(int id);
  Future<int> lendBook(int bookId, int userId);
  Future<int> returnBook(int bookId, int userId);
}

class BookService extends BookServiceInterface {
  Preferences preferences = Preferences();
  @override
  Future<List<Book>> getBooks(String searchData, bool filter) async {
    final dio = Dio();
    late Response resp;
    var header = headers(preferences.token);
    String endpoint = !filter ? "titulo" : "autor";
    try {
      resp = await dio.get(
        'https://bliblioteca-app.fly.dev/v1/user/find?$endpoint=$searchData',
        options: Options(headers: header),
      );
      List respBooks = resp.data["libro"];
      List<Book> books = respBooks
          .map(
            (e) => Book(
              id: e["id_libro"],
              title: e["titulo"],
              autor: e["autor"],
            ),
          )
          .toList();
      return books;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<int> createBook(String title, String autor) async {
    final body = {
      "titulo": title,
      "autor": autor,
    };

    final dio = Dio();
    late Response resp;
    var header = headers(preferences.token);

    try {
      resp = await dio.post(
        'https://bliblioteca-app.fly.dev/v1/libro',
        options: Options(headers: header),
        data: body,
      );
      return resp.statusCode ?? 400;
    } catch (e) {
      return 400;
    }
  }

  @override
  Future<int> deleteBook(int id) async {
    final dio = Dio();
    late Response resp;
    var header = headers(preferences.token);

    try {
      resp = await dio.delete(
        'https://bliblioteca-app.fly.dev/v1/libro/$id',
        options: Options(headers: header),
      );
      return resp.statusCode ?? 400;
    } catch (e) {
      return 400;
    }
  }

  @override
  Future<int> lendBook(int bookId, int userId) async {
    final body = {
      "libroId": bookId,
      "usuarioId": userId,
      "fechaDevolucion":
          dateParse(DateTime.now().add(const Duration(days: 30))),
    };

    final dio = Dio();
    late Response resp;
    var header = headers(preferences.token);

    try {
      resp = await dio.post(
        'https://bliblioteca-app.fly.dev/v1/user/prestar-libro',
        options: Options(headers: header),
        data: body,
      );
      return resp.statusCode ?? 400;
    } catch (e) {
      return 400;
    }
  }

  @override
  Future<int> returnBook(int bookId, int userId) async {
    final body = {
      "libroId": bookId,
      "usuarioId": userId,
    };

    final dio = Dio();
    late Response resp;
    var header = headers(preferences.token);

    try {
      resp = await dio.post(
        'https://bliblioteca-app.fly.dev/v1/user/devolver-libro',
        options: Options(headers: header),
        data: body,
      );
      return resp.statusCode ?? 400;
    } catch (e) {
      return 400;
    }
  }
}
