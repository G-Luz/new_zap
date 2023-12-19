import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/chat/sub_modules/custom_chat_wallpaper/controller/custom_chat_wallpaper_controller.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:new_zap/widgets/app_textfield.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomChatWallpaperPage extends StatefulWidget {
  const CustomChatWallpaperPage({Key? key}) : super(key: key);

  @override
  _CustomChatWallpaperPageState createState() =>
      _CustomChatWallpaperPageState();
}

class _CustomChatWallpaperPageState extends State<CustomChatWallpaperPage> {
  final controller = Modular.get<CustomChatWallpaperController>();
  final routeArgs = Modular.args;

  @override
  void initState() {
    super.initState();

    if (routeArgs.data != null) {
      controller.updateObjectsReferences(
        chat: routeArgs.data['chat'],
        user: routeArgs.data['user'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBlue
          : AppColors.darkWhite,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const AppText(
          text: 'Papel de parede personalizado',
          fontSize: 17,
        ),
        centerTitle: false,
        leadingWidth: 75,
        leading: Center(
          child: IconButton(
            highlightColor: Colors.grey.withOpacity(.1),
            splashColor: Colors.transparent,
            icon: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CupertinoIcons.arrow_left,
                  color: AppColors.darkWhite,
                  size: 20,
                ),
              ],
            ),
            onPressed: () => Modular.to.pop(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: AppColors.darkWhite,
            ),
            highlightColor: Colors.grey.withOpacity(.2),
            onPressed: () async {
              final updatedChat = await controller
                  .onSubmittedChatCustomWallpaper(controller.chat!);
              Modular.to.pop(updatedChat);
            },
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          if (controller.status == CustomWallpaperStatus.success) {
            return SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: deviceSize.height * .6,
                      width: deviceSize.width * .6,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller.selectedBackgroundColor,
                        image: controller.selectedBackgroundImageUrl != null
                            ? DecorationImage(
                                image: NetworkImage(
                                  controller.selectedBackgroundImageUrl!,
                                ),
                                fit: BoxFit.fill,
                              )
                            : controller.selectedBackgroundImagePath != null
                                ? DecorationImage(
                                    image: FileImage(
                                      File(controller
                                          .selectedBackgroundImagePath!),
                                    ),
                                    fit: BoxFit.fill,
                                  )
                                : null,
                        border: Border.all(
                          color: AppColors.darkWhite,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircleAvatar(
                                    backgroundImage: controller
                                                .contactUser?.profileUrlImage ==
                                            null
                                        ? const AssetImage(AppImages.icUser)
                                        : NetworkImage(
                                            controller
                                                .contactUser!.profileUrlImage!,
                                          ) as ImageProvider,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                AppText(
                                  text: controller.contactUser!.name,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) =>
                                  CustomChatWallpaperMessage(
                                isFromMe: index % 2 == 0,
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: deviceSize.width * .4,
                                  child: AppTextfield(
                                    borderColor:
                                        Theme.of(context).colorScheme.secondary,
                                    enable: false,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const IconButton(
                                    icon: Icon(
                                      Icons.send_sharp,
                                      size: 15,
                                      color: AppColors.darkWhite,
                                    ),
                                    onPressed: null,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Selecione uma cor',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor:
                                      controller.selectedBackgroundColor ??
                                          const Color(0xffffffff),
                                  onColorChanged: (selectedColor) {
                                    controller.changeChatBackgroundColor(
                                        selectedColor);
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                  child: const Text('Selecionar'),
                                  onPressed: () {
                                    controller.selectedChatBackgroundColor();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: AppText(
                        text: 'Selecionar cores sólidas',
                        fontColor: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const AppText(
                    text: 'OU',
                    fontColor: Colors.grey,
                    fontSize: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () async {
                        final imgPath = await Modular.to
                            .pushNamed(Routes.searchProfileWebImageModuleRoute);

                        if (imgPath != null && imgPath is String) {
                          controller.changeChatBackgroundImage(imgPath);
                        }
                      },
                      child: AppText(
                        text: 'Selecionar imagens',
                        fontColor: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class CustomChatWallpaperMessage extends StatelessWidget {
  const CustomChatWallpaperMessage({
    Key? key,
    required this.isFromMe,
  }) : super(key: key);

  final bool isFromMe;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      child: Row(
        mainAxisAlignment:
            isFromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            width: deviceSize.width * .4,
            padding:
                const EdgeInsets.only(left: 10, right: 7, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: isFromMe ? AppColors.darkBlue2 : AppColors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(13),
                bottomRight: const Radius.circular(13),
                topLeft: isFromMe
                    ? const Radius.circular(13)
                    : const Radius.circular(0),
                topRight: isFromMe
                    ? const Radius.circular(0)
                    : const Radius.circular(13),
              ),
            ),
            child: AppText(
              text: isFromMe ? 'Mensagem enviada' : 'Mensagem recebida',
              fontColor: AppColors.darkWhite,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
