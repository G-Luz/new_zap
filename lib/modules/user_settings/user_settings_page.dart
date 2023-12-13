import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/user_settings/controller/user_settings_controller.dart';
import 'package:new_zap/modules/user_settings/widgets/dialog_blocked_contacts.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:new_zap/widgets/app_textfield.dart';
import 'package:rive/rive.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({Key? key}) : super(key: key);

  @override
  _UserSettingsPageState createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  final controller = Modular.get<UserSettingsController>();

  late SMIBool darkMode;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      'theme switch', //TODO: https://stackoverflow.com/a/67826193/10952599 - Animation Name
    );
    artboard.addController(controller!);
    return controller;
  }

  @override
  void initState() {
    super.initState();
    controller.fillEditingFields();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkBlue
              : AppColors.darkWhite,
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const AppText(
              text: 'Minhas configurações',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_left,
                color: AppColors.darkWhite,
              ),
              onPressed: () => Modular.to.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.logout_outlined,
                  color: AppColors.darkWhite,
                ),
                highlightColor: Colors.grey.withOpacity(.2),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.check,
                  color: AppColors.darkWhite,
                ),
                highlightColor: Colors.grey.withOpacity(.2),
                onPressed: () {
                  // showLoaderDialog(context);
                  controller.onSubmittedUpdateUserData();
                  // if (controller.userSettingsStatus ==
                  //     UserSettingsStatus.success) {
                  //   Navigator.pop(context);
                  //   Modular.to.pop();
                  // }
                },
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          darkMode.value = !darkMode.value;
                        });

                        controller.changeTheme();
                      },
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: RiveAnimation.asset(
                          AppImages.riveLightDark,
                          onInit: (artboard) {
                            StateMachineController controller =
                                getRiveController(artboard);
                            darkMode =
                                controller.findSMI('Dark Theme') as SMIBool;

                            setState(() {
                              darkMode.value = this.controller.theme.isDarkTheme;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: deviceSize.height * .3,
                  width: deviceSize.width,
                  margin: const EdgeInsets.all(30),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CircleAvatar(
                          backgroundImage: buildProfileImageWidget(
                                controller.currentUserController.currentUser!
                                    .profileUrlImage,
                                controller.selectedImage?.path,
                              ) ??
                              const AssetImage(AppImages.icUser),
                        ),
                      ),
                      Positioned.fill(
                        left: 150,
                        top: 200,
                        child: GestureDetector(
                          onTap: () async {
                            final downloadedImagePath = await Modular.to
                                .pushNamed(
                                    Routes.searchProfileWebImageModuleRoute);
                            if (downloadedImagePath is String) {
                              controller
                                  .changeProfileImage(downloadedImagePath);
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.teal,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.camera,
                                color: AppColors.darkWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppText(
                  text: controller.currentUserController.currentUser!.email!,
                  fontColor: AppColors.darkBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 65,
                  child: AppTextfield(
                    hint: 'Digite seu nome',
                    initialValue:
                        controller.currentUserController.currentUser!.name,
                    preffixIcon: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Image.asset(
                        AppImages.icEmail,
                        height: 20,
                      ),
                    ),
                    onChanged: (name) => controller.onNameChanged(name),
                  ),
                ),
                SizedBox(
                  height: 65,
                  child: AppTextfield(
                    hint: 'Digite sua idade',
                    initialValue:
                        controller.currentUserController.currentUser!.age,
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
                GestureDetector(
                  onTap: () => showBlockedDialogContact(context),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey[700]!,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 35,
                                width: 35,
                                child: Image.asset(
                                  AppImages.icPassword,
                                  height: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const AppText(
                                text: 'Contatos bloqueados',
                                fontColor: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  ImageProvider? buildProfileImageWidget(
    String? profileUrlImage,
    String? selectedImagePath,
  ) {
    if (profileUrlImage != null && selectedImagePath == null) {
      return NetworkImage(profileUrlImage);
    } else if (profileUrlImage == null && selectedImagePath != null) {
      return FileImage(File(selectedImagePath));
    } else if (profileUrlImage != null && selectedImagePath != null) {
      return FileImage(File(selectedImagePath));
    }

    return null;
  }
}
