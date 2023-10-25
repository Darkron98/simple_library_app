class RegisterInfo {
  const RegisterInfo({
    required this.name,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.rol,
  });

  final String name;
  final String lastName;
  final String userName;
  final String password;
  final int rol;

  RegisterInfo copyWith({
    String? name,
    String? lastName,
    String? userName,
    String? password,
    int? rol,
  }) =>
      RegisterInfo(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        rol: rol ?? this.rol,
      );
}
