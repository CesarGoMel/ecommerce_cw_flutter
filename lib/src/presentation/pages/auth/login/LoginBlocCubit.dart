import 'package:ecommerce_cw_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_cw_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_cw_flutter/src/presentation/pages/auth/login/LoginBLocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  LoginBlocCubit() : super(LoginInitial());

  Authservice authservice = Authservice();

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void login()  async {
    print('Email: ${_emailController.value}');
    print('Password: ${_passwordController.value}');
    AuthResponse response = await authservice.login(_emailController.value, _passwordController.value);
    print('Response: $response');
  }

  void changeEmail(String email) {
    bool emailFormatValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isNotEmpty && email.length < 5) {
      _emailController.sink.addError('Al menos 5 caracteres');
    } else if (email.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError('El email no es valido');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _passwordController.sink.addError('debe tener más de 6 caracteres');
    } else {
      _passwordController.sink.add(password);
    }
  }

  void dispose() {
    changeEmail('');
    changePassword('');
  }
}
