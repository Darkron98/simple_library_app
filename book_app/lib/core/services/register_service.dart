import 'package:book_app/core/logic/logic.dart';
import 'package:book_app/core/model/register_user.dart';
import 'package:book_app/core/preferences/preferences.dart';
import 'package:dio/dio.dart';

abstract class UserRegisterInterface {
  Future<int> registerUser(RegisterInfo data);
}

class UserRegisterService extends UserRegisterInterface {
  static final UserRegisterService _singleton = UserRegisterService._internal();

  factory UserRegisterService() {
    return _singleton;
  }

  UserRegisterService._internal();

  @override
  Future<int> registerUser(RegisterInfo data) async {
    var body = {
      'nombre_usuario': data.userName,
      'nombres': data.name,
      'apellidos': data.lastName,
      'contrasenia': data.password,
      'id_rol': data.rol,
    };
    var prefs = Preferences();
    final dio = Dio();
    final Response resp;
    final header = headers(prefs.token);
    try {
      resp = await dio.post(
        'https://bliblioteca-app.fly.dev/v1/user',
        data: body,
        options: Options(headers: header),
      );
      return resp.statusCode ?? 400;
    } catch (e) {
      return 400;
    }
  }
}
