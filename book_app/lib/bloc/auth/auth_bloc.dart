import 'package:bloc/bloc.dart';
import 'package:book_app/core/preferences/preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/model/auth_user.dart';
import '../../core/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Preferences prefs = Preferences();

  AuthBloc() : super(AuthState()) {
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
        prefs.name = "${userLoged.names} ${userLoged.lastNames}";
        prefs.user = userLoged.userName;
        if (userLoged.statusCode == 200) {
          emit(state.copyWith(
            loading: false,
            success: true,
            failure: false,
          ));
        } else {
          emit(state.copyWith(
            loading: false,
            success: false,
            failure: true,
          ));
        }
      },
    );
    on<Restore>(
      (event, emit) => emit(state.copyWith(
        success: false,
        failure: false,
      )),
    );
  }
}
