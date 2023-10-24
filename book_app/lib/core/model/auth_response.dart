class AuthResp {
  AuthResp({
    required this.id,
    required this.userName,
    required this.names,
    required this.lastNames,
    required this.rol,
    required this.token,
    required this.statusCode,
  });
  final int id;
  final String userName;
  final String names;
  final String lastNames;
  final int rol;
  final String token;
  final int statusCode;

  AuthResp copyWith({
    int? id,
    String? userName,
    String? names,
    String? lastNames,
    int? rol,
    String? token,
    int? statusCode,
  }) =>
      AuthResp(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        names: names ?? this.names,
        lastNames: lastNames ?? this.lastNames,
        rol: rol ?? this.rol,
        token: token ?? this.token,
        statusCode: statusCode ?? this.statusCode,
      );
}
