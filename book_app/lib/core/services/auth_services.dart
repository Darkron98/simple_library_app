import 'dart:convert';

import 'package:book_app/core/core.dart';
import 'package:book_app/core/model/auth_response.dart';
import 'package:dio/dio.dart';

abstract class AuthServivecInterface {
  Future<AuthResp> login(User user);
}

class AuthServices extends AuthServivecInterface {
  static final AuthServices _singleton = AuthServices._internal();

  factory AuthServices() {
    return _singleton;
  }

  AuthServices._internal();

  @override
  Future<AuthResp> login(User user) async {
    final body = {
      "nombre_usuario": user.user,
      "contrasenia": user.pass,
    };
    final dio = Dio();
    late Response resp;
    try {
      resp = await dio.post(
        'https://bliblioteca-app.fly.dev/v1/login',
        data: jsonEncode(body),
      );
      dynamic userInfo = resp.data["validacionNombreUsuario"];
      dynamic userToken = resp.data["token"];
      return AuthResp(
          id: userInfo['id_usuario'],
          userName: userInfo['nombre_usuario'],
          names: userInfo['nombres'],
          lastNames: userInfo['apellidos'],
          rol: userInfo['id_rol'],
          token: userToken,
          statusCode: 200);
    } catch (e) {
      return AuthResp(
          id: 0,
          userName: '',
          names: '',
          lastNames: '',
          rol: 100,
          token: '',
          statusCode: 400);
    }
  }
}
