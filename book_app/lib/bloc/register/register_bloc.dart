import 'package:bloc/bloc.dart';
import 'package:book_app/core/logic/logic.dart';
import 'package:book_app/core/services/register_service.dart';
import 'package:equatable/equatable.dart';

import '../../core/model/register_user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<TypeName>(
      (event, emit) {
        emit(state.copyWith(name: event.name));
        emit(state.copyWith(validateForm: validateUserRegister(state)));
      },
    );
    on<TypeLastName>((event, emit) {
      emit(state.copyWith(lastName: event.lastName));
      emit(state.copyWith(validateForm: validateUserRegister(state)));
    });
    on<TypeUserName>((event, emit) {
      emit(state.copyWith(userName: event.userName));
      emit(state.copyWith(validateForm: validateUserRegister(state)));
    });
    on<TypePassword>((event, emit) {
      emit(state.copyWith(password: event.pass));
      emit(state.copyWith(validateForm: validateUserRegister(state)));
    });
    on<ConfirmationPass>((event, emit) {
      emit(state.copyWith(confirmationPass: event.confirmationPass));
      emit(state.copyWith(validateForm: validateUserRegister(state)));
    });
    on<Rol>((event, emit) {
      emit(state.copyWith(rol: event.rol));
      emit(state.copyWith(validateForm: validateUserRegister(state)));
    });
    on<Register>(
      (event, emit) async {
        emit(state.copyWith(loading: true));
        RegisterInfo data = RegisterInfo(
          name: state.name,
          lastName: state.lastName,
          userName: state.userName,
          password: state.password,
          rol: state.rol,
        );
        var resp = await UserRegisterService().registerUser(data);

        emit(state.copyWith(success: resp == 201));
        emit(state.copyWith(loading: false, success: false));
      },
    );

    on<ValidateForm>(
      (event, emit) {
        emit(state.copyWith(validateForm: event.validateForm));
      },
    );
    on<RestoreRegister>((event, emit) => emit(const RegisterState()));
  }
}
