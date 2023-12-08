import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/welcome/controller/login/login_controller.dart';
import 'package:new_zap/modules/welcome/widgets/custom_positioned.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:new_zap/widgets/app_textfield.dart';
import 'package:new_zap/widgets/toast.dart';
import 'package:rive/rive.dart';

class LoginFormDialog extends StatefulWidget {
  const LoginFormDialog({Key? key}) : super(key: key);

  @override
  State<LoginFormDialog> createState() => _LoginFormDialogState();
}

class _LoginFormDialogState extends State<LoginFormDialog> {
  final controller = Modular.get<LoginController>();

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Observer(
      builder: (context) {
        return Stack(
          children: [
            Center(
              child: Container(
                height: deviceSize.height * .8,
                // width: deviceSize.width * .7,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.darkWhite,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: deviceSize.height * .3,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AppImages.loginIcon,
                                ),
                              ),
                            ),
                          ),
                          const AppText(
                            text: 'Autenticação',
                            fontColor: AppColors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            fontFamily: 'Poppins',
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            height: 65,
                            child: AppTextfield(
                              hint: 'Insira seu e-mail',
                              preffixIcon: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Image.asset(
                                  AppImages.icEmail,
                                  height: 20,
                                ),
                              ),
                              onChanged: (email) =>
                                  controller.onEmailChanged(email),
                            ),
                          ),
                          SizedBox(
                            height: 65,
                            child: AppTextfield(
                              hint: 'Insira sua senha',
                              obscureText: true,
                              maxLines: 1,
                              preffixIcon: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Image.asset(
                                  AppImages.icPassword,
                                  height: 20,
                                ),
                              ),
                              onChanged: (password) =>
                                  controller.onPasswordChanged(password),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.blue),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                final loginResult =
                                    await controller.onSubmittedForm();

                                if (controller.loginStatus ==
                                    LoginFormStatus.success) {
                                  check.fire();
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      controller.showLoading = false;
                                      confetti.fire();
                                      Future.delayed(
                                        const Duration(milliseconds: 1250),
                                        () => Modular.to.pushReplacementNamed(
                                            Routes.homeModuleRoute,
                                            arguments: {
                                              AppCollections
                                                      .userDataArgumentKey:
                                                  loginResult,
                                            }),
                                      );
                                    },
                                  );
                                }

                                if (controller.loginStatus ==
                                    LoginFormStatus.failure) {
                                  error.fire();
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      controller.showLoading = false;
                                      showToast(loginResult);
                                    },
                                  );
                                }
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.arrow_right,
                                    color: AppColors.darkWhite,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  AppText(
                                    text: 'Entrar',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 35,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  text: 'Ou',
                                  fontColor: AppColors.darkBlue2,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Efetue agora o seu ',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {},
                                      text: 'cadastro',
                                      style: const TextStyle(
                                        color: AppColors.darkBlue,
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: -65,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: AppColors.darkBlue,
                            child: Icon(
                              Icons.close,
                              color: AppColors.darkWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            controller.showLoading
                ? CustomPositioned(
                    child: Column(
                      children: [
                        const Spacer(),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: RiveAnimation.asset(
                            AppImages.riveCheck,
                            onInit: (artboard) {
                              StateMachineController controller =
                                  getRiveController(artboard);
                              check = controller.findSMI('Check') as SMITrigger;
                              error = controller.findSMI('Error') as SMITrigger;
                              reset = controller.findSMI('Reset') as SMITrigger;
                            },
                          ),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  )
                : const SizedBox(),
            controller.showConfettiEffect
                ? CustomPositioned(
                    child: Transform.scale(
                      scale: 6,
                      child: RiveAnimation.asset(
                        AppImages.riveConffeti,
                        onInit: (artboard) {
                          StateMachineController controller =
                              getRiveController(artboard);
                          confetti = controller.findSMI('Trigger explosion')
                              as SMITrigger;
                        },
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
