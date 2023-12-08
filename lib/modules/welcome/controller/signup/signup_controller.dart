import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/welcome/repository/welcome_repository.dart';
import 'package:new_zap/utils/string_utils.dart';

part 'signup_controller.g.dart';

enum SignupFormStatus { initial, loading, success, failure }

class SignupController = SignupControllerBase with _$SignupController;

abstract class SignupControllerBase with Store {
  final _repository = Modular.get<WelcomeRepository>();

  @observable
  SignupFormStatus signupStatus = SignupFormStatus.initial;

  @observable
  bool showLoading = false;

  @observable
  bool showConfettiEffect = false;

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String age = '';

  @observable
  String password = '';

  @observable
  String repeatPassword = '';

  @action
  onNameChanged(String name) {
    if (name.isNotEmpty) {
      this.name = name;
    }
  }

  @action
  onEmailChanged(String email) {
    if (email.isNotEmpty && email.isValidEmail()) {
      this.email = email;
    }
  }

  @action
  onAgeChanged(String age) {
    if (age.isNotEmpty && int.parse(age) > 18) {
      this.age = age;
    }
  }

  @action
  onPasswordChanged(String password) {
    if (password.isNotEmpty && password.length > 5) {
      this.password = password;
    }
  }

  @action
  onRepeatPasswordChanged(String repeatPass) {
    if (repeatPass.isNotEmpty && repeatPass == password) {
      repeatPassword = repeatPass;
    }
  }

  bool validateFields() {
    return name.isNotEmpty &&
        email.isNotEmpty &&
        age.isNotEmpty &&
        password.isNotEmpty &&
        repeatPassword.isNotEmpty;
  }

  @action
  Future<String> onRegisterUser() async {
    signupStatus = SignupFormStatus.loading;
    showLoading = true;
    showConfettiEffect = true;

    return await Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (validateFields()) {
          final user = User(name: name, email: email, age: age);
          final authResult = await _repository
              .createUserAuthenticationByEmailAndPassword(user, password);
          if (authResult != null) {
            signupStatus = SignupFormStatus.success;
          } else {
            signupStatus = SignupFormStatus.failure;
            return 'Este email já está sendo utilizado.';
          }
        } else {
          signupStatus = SignupFormStatus.failure;
          return 'Preencha os campos corretamente.';
        }
        return '';
      },
    );
  }
}
