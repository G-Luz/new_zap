import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/modules/welcome/repository/welcome_repository.dart';
import 'package:new_zap/utils/string_utils.dart';

part 'login_controller.g.dart';

enum LoginFormStatus { initial, loading, success, failure }

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final _repository = Modular.get<WelcomeRepository>();

  @observable
  bool showLoading = false;

  @observable
  bool showConfettiEffect = false;

  @observable
  LoginFormStatus loginStatus = LoginFormStatus.initial;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  onEmailChanged(String email) {
    if (email.isNotEmpty) {
      if (email.isValidEmail()) {
        this.email = email;
      }
    }
  }

  @action
  onPasswordChanged(String password) {
    this.password = password;
  }

  Future<User?> automaticallySignin() async {
    return _repository.isLoggedin();
  }

  @action
  Future<dynamic> onSubmittedForm() async {
    loginStatus = LoginFormStatus.loading;
    showLoading = true;
    showConfettiEffect = true;

    return await Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (email.isNotEmpty && password.isNotEmpty) {
          final loginResult = await _repository.userSignin(email, password);

          if (loginResult is UserCredential) {
            loginStatus = LoginFormStatus.success;
            return loginResult.user!;
          } else {
            loginStatus = LoginFormStatus.failure;
            return loginResult;
          }
        } else {
          loginStatus = LoginFormStatus.failure;
          return 'Verifique os campos e tente novamente.';
        }
      },
    );
  }
}
