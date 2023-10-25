part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.name = '',
    this.lastName = '',
    this.userName = '',
    this.password = '',
    registerInfo,
    this.confirmationPass = '',
    this.rol = 0,
    this.success = false,
    this.loading = false,
    this.validateForm = true,
  }) : registerInfo = const RegisterInfo(
          name: '',
          lastName: '',
          userName: '',
          password: '',
          rol: 100,
        );
  final RegisterInfo registerInfo;
  final String name;
  final String lastName;
  final String userName;
  final String password;
  final String confirmationPass;
  final int rol;
  final bool success;
  final bool loading;
  final bool validateForm;

  RegisterState copyWith({
    RegisterInfo? registerInfo,
    String? name,
    String? lastName,
    String? userName,
    String? password,
    String? confirmationPass,
    int? rol,
    bool? success,
    bool? loading,
    bool? validateForm,
  }) =>
      RegisterState(
        registerInfo: registerInfo ?? this.registerInfo,
        confirmationPass: confirmationPass ?? this.confirmationPass,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        rol: rol ?? this.rol,
        success: success ?? this.success,
        loading: loading ?? this.loading,
        validateForm: validateForm ?? this.validateForm,
      );

  @override
  List<Object> get props => [
        registerInfo,
        name,
        lastName,
        userName,
        password,
        confirmationPass,
        rol,
        success,
        loading,
        validateForm,
      ];
}
