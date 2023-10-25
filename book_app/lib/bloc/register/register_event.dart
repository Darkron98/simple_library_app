part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class TypeName extends RegisterEvent {
  const TypeName(this.name);
  final String name;

  @override
  List<Object> get props => [name];
}

class TypeLastName extends RegisterEvent {
  const TypeLastName(this.lastName);
  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class TypeUserName extends RegisterEvent {
  const TypeUserName(this.userName);
  final String userName;

  @override
  List<Object> get props => [userName];
}

class TypePassword extends RegisterEvent {
  const TypePassword(this.pass);
  final String pass;

  @override
  List<Object> get props => [pass];
}

class ConfirmationPass extends RegisterEvent {
  const ConfirmationPass(this.confirmationPass);
  final String confirmationPass;

  @override
  List<Object> get props => [confirmationPass];
}

class ValidateForm extends RegisterEvent {
  const ValidateForm(this.validateForm);
  final bool validateForm;

  @override
  List<Object> get props => [validateForm];
}

class Register extends RegisterEvent {
  const Register();
  @override
  List<Object> get props => [];
}

class Rol extends RegisterEvent {
  const Rol(this.rol);
  final int rol;

  @override
  List<Object> get props => [rol];
}

class RestoreRegister extends RegisterEvent {
  const RestoreRegister();

  @override
  List<Object> get props => [];
}
