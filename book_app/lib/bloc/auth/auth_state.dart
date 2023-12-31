part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.userName = '',
    this.pass = '',
    user,
    this.loading = false,
    this.success = false,
    this.failure = false,
    this.changeFlag = true,
  }) : user = const User(user: '', pass: '');

  final String userName;
  final String pass;
  final User user;
  final bool loading;
  final bool success;
  final bool failure;
  final bool changeFlag;

  AuthState copyWith({
    String? userName,
    String? pass,
    User? user,
    bool? loading,
    bool? success,
    bool? failure,
    bool? changeFlag,
  }) =>
      AuthState(
        userName: userName ?? this.userName,
        pass: pass ?? this.pass,
        user: user ?? this.user,
        loading: loading ?? this.loading,
        success: success ?? this.success,
        failure: failure ?? this.failure,
        changeFlag: changeFlag ?? this.changeFlag,
      );

  @override
  List<Object?> get props => [
        user,
        userName,
        pass,
        loading,
        success,
        failure,
        changeFlag,
      ];
}
