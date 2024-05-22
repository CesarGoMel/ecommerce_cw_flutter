import 'package:ecommerce_cw_flutter/src/presentation/pages/auth/login/LoginBLocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlocCubit extends Cubit <LoginBlocState> {

  LoginBlocCubit() : super(LoginInitial());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void changeEmail(String email) {
    if(email.length < 6) {
      _emailController.sink.addError('La longitud debe ser mayor a 6 caracteres');
    }
    else{
    _emailController.sink.add(email);
  }
  }

  void changepassword(String password) {
    if (password.length < 6){
      _passwordController.sink.addError('debe tener m{as de 6 caracteres}');
    }
    else 
    {    _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateForm => Rx.combineLatest2(
    emailStream, passwordStream, (a, b)=> true
     );

     void dispose() {
      changeEmail('');
      changepassword('');
     }

  void login() {
    print('Email: ${_emailController.value}');
    print('Password: ${_passwordController.value}');
  }
}