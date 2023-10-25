import 'package:bloc/bloc.dart';
import 'package:book_app/core/preferences/preferences.dart';
import 'package:equatable/equatable.dart';

import '../../core/model/auth_user.dart';
import '../../core/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Preferences prefs = Preferences();

  AuthBloc() : super(const AuthState()) {
    on<TypeUser>(
      (event, emit) => emit(
        state.copyWith(userName: event.user),
      ),
    );
    on<TypePass>((event, emit) {
      emit(
        state.copyWith(pass: event.pass),
      );
    });

    on<Submitted>(
      (event, emit) async {
        emit(state.copyWith(loading: true));
        var user = User(user: state.userName, pass: state.pass);
        var userLoged = await AuthServices().login(user);
        prefs.token = userLoged.token;
        prefs.rol = userLoged.rol;
        prefs.userId = userLoged.id;
        prefs.name = userLoged.names;
        prefs.lastName = userLoged.lastNames;
        prefs.user = userLoged.userName;
        emit(state.copyWith(
          loading: false,
          success: userLoged.statusCode == 200,
          failure: userLoged.statusCode == 400,
        ));
      },
    );
    on<Restore>(
      (event, emit) => emit(state.copyWith(
        success: false,
        failure: false,
        userName: '',
        pass: '',
      )),
    );
    on<NewState>(
      (event, emit) => emit(state.copyWith(changeFlag: !state.changeFlag)),
    );
  }
}
