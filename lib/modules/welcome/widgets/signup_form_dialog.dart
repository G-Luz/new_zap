import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/modules/welcome/controller/signup/signup_controller.dart';
import 'package:new_zap/modules/welcome/widgets/custom_positioned.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:new_zap/widgets/app_textfield.dart';
import 'package:new_zap/widgets/toast.dart';
import 'package:rive/rive.dart';

class SignupFormDialog extends StatefulWidget {
  SignupFormDialog({Key? key}) : super(key: key);

  @override
  State<SignupFormDialog> createState() => _SignupFormDialogState();
}

class _SignupFormDialogState extends State<SignupFormDialog> {
  final controller = Modular.get<SignupController>();

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
                            height: deviceSize.height * .2,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AppImages.signupIcon,
                                ),
                              ),
                            ),
                          ),
                          const AppText(
                            text: 'Cadastro',
                            fontColor: AppColors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            fontFamily: 'Poppins',
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            height: 65,
                            child: AppTextfield(
                              hint: 'Insira seu nome',
                              preffixIcon: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Image.asset(
                                  AppImages.icEmail,
                                  height: 20,
                                ),
                              ),
                              onChanged: (name) =>
                                  controller.onNameChanged(name),
                            ),
                          ),
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
                              hint: 'Insira sua idade',
                              keyboardType: TextInputType.number,
                              preffixIcon: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Image.asset(
                                  AppImages.icEmail,
                                  height: 20,
                                ),
                              ),
                              onChanged: (age) => controller.onAgeChanged(age),
                            ),
                          ),
                          SizedBox(
                            height: 65,
                            child: AppTextfield(
                              hint: 'Insira sua senha',
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
                            height: 65,
                            child: AppTextfield(
                              hint: 'Repita sua senha',
                              preffixIcon: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Image.asset(
                                  AppImages.icPassword,
                                  height: 20,
                                ),
                              ),
                              onChanged: (repeatPass) => controller
                                  .onRepeatPasswordChanged(repeatPass),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  controller.signupStatus ==
                                          SignupFormStatus.loading
                                      ? Colors.grey
                                      : AppColors.blue,
                                ),
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
                              onPressed: controller.signupStatus ==
                                      SignupFormStatus.loading
                                  ? null
                                  : () async {
                                      final registerResult =
                                          await controller.onRegisterUser();

                                      if (controller.signupStatus ==
                                          SignupFormStatus.success) {
                                        check.fire();
                                        Future.delayed(
                                          const Duration(seconds: 2),
                                          () {
                                            controller.showLoading = false;
                                            confetti.fire();
                                            Future.delayed(
                                              const Duration(milliseconds: 1250),
                                              () {
                                                Modular.to.pop();
                                              },
                                            );
                                          },
                                        );
                                      }

                                      if (controller.signupStatus ==
                                          SignupFormStatus.failure) {
                                        error.fire();
                                        Future.delayed(
                                          const Duration(seconds: 2),
                                          () {
                                            controller.showLoading = false;
                                            showToast(registerResult);
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
                                    text: 'Cadastrar',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ),
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
