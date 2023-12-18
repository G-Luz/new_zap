import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/models/chat/chat.dart';
import 'package:new_zap/models/chat/message/message.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/home/widgets/app_message_item_skeleton_loading.dart';
import 'package:new_zap/utils/date_utils.dart';
import 'package:new_zap/widgets/app_text.dart';

class AppMessageItem extends StatelessWidget {
  const AppMessageItem({
    Key? key,
    this.message,
    this.user,
    required this.chat,
  }) : super(key: key);

  final Message? message;
  final User? user;
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    if (user == null) {
      return const ChatItemSkeletonLoading();
    }

    return InkWell(
      splashColor: Colors.grey.withOpacity(.1),
      highlightColor: Colors.grey.withOpacity(.1),
      onTap: () => Modular.to.pushNamed(
        Routes.chatModuleRoute,
        arguments: {'chat': chat},
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 45,
                  width: 45,
                  child: CircleAvatar(
                    backgroundImage: user?.profileUrlImage == null
                        ? const AssetImage(AppImages.icUser)
                        : NetworkImage(user!.profileUrlImage!) as ImageProvider,
                  ),
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user!.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: deviceSize.width * .5,
                      child: Text(
                        message != null ? message!.content! : '',
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: deviceSize.width * .15,
                  child: Text(
                    message != null
                        ? message!.sendDate!
                            .checkDateToShowOnChat(message!.sendDate!)
                        : '',
                    style: Theme.of(context).textTheme.labelSmall,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                message == null
                    ? const SizedBox()
                    : Container(
                        width: 25,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: AppText(
                            text: message!.viewed! ? '1' : '0',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
