import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/welcome/controller/login/login_controller.dart';
import 'package:new_zap/modules/welcome/widgets/animated_button.dart';
import 'package:new_zap/modules/welcome/widgets/login_form_dialog.dart';
import 'package:new_zap/modules/welcome/widgets/signup_form_dialog.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:rive/rive.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final loginController = Modular.get<LoginController>();
  late RiveAnimationController _loginButtonController;
  late RiveAnimationController _signupButtonController;

  @override
  void initState() {
    super.initState();
    _loginButtonController = OneShotAnimation(
      'active',
      autoplay: false,
    );
    _signupButtonController = OneShotAnimation(
      'active',
      autoplay: false,
    );
    isSigninRedirect();
  }

  isSigninRedirect() async {
    final loginResult = await loginController.automaticallySignin();
    if (loginResult != null) {
      Modular.to.pushReplacementNamed(
        Routes.homeModuleRoute,
        arguments: {AppCollections.userDataArgumentKey: loginResult,},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.darkWhite,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Positioned(
              width: deviceSize.width * 1.2,
              bottom: 200,
              // top: 150,
              child: Image.asset(AppImages.spline),
            ),
            const RiveAnimation.asset(
              AppImages.riveShapes,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 10,
                ),
                child: const SizedBox(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: deviceSize.height * .1,
                      width: deviceSize.width * .8,
                      child: const AppText(
                        text: 'Bem vindo(a) ao New ZapGo',
                        fontSize: 45,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.darkBlue2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: deviceSize.height * .2,
                      width: deviceSize.width * .8,
                      child: const AppText(
                        text:
                            'Um projeto voltado para estudo do framework Flutter com uso de diversas tecnologias disponíveis no mercado',
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.darkBlue,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    AnimatedButton(
                      title: 'Entre em sua conta',
                      reverseWidgets: false,
                      animationController: _loginButtonController,
                      onPressedCallback: () {
                        _loginButtonController.isActive = true;
                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () => showFormDialog(
                            context,
                            const LoginFormDialog(),
                            const Offset(1, 0),
                          ),
                        );
                      },
                    ),
                    AnimatedButton(
                      title: 'Cria uma nova conta',
                      reverseWidgets: true,
                      animationController: _signupButtonController,
                      onPressedCallback: () {
                        _signupButtonController.isActive = true;
                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () => showFormDialog(
                            context,
                            SignupFormDialog(),
                            const Offset(-1, 0),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: deviceSize.height * .1,
                      width: deviceSize.width * .8,
                      child: const AppText(
                        text:
                            'Comece agora a enviar mensagens para seus contatos',
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.darkBlue,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showFormDialog(
  BuildContext context,
  Widget formPage,
  Offset pageTransitionDirection,
) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 450),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(
        begin: pageTransitionDirection,
        end: Offset.zero,
      );
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => formPage,
  );
}
