import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/models/chat/message/message.dart' as model;
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/chat/controller/chat_controller.dart';
import 'package:new_zap/modules/chat/widgets/empty_message_list.dart';
import 'package:new_zap/utils/date_utils.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:new_zap/widgets/app_textfield.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = Modular.get<ChatController>();
  final routeArgs = Modular.args;

  @override
  void initState() {
    super.initState();

    if (routeArgs.data != null) {
      controller.onUpdateChatRef(routeArgs.data['chat']);
      controller.defineRecipientChatUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            final currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: AppText(
                text: controller.status == ChatStatus.loading
                    ? ''
                    : controller.recipientUser!.name,
                fontSize: 17,
              ),
              leadingWidth: 75,
              leading: IconButton(
                highlightColor: Colors.grey.withOpacity(.1),
                splashColor: Colors.transparent,
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      CupertinoIcons.arrow_left,
                      color: AppColors.darkWhite,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        backgroundImage: controller.status == ChatStatus.loading
                            ? const AssetImage(AppImages.icUser)
                            : controller.recipientUser?.profileUrlImage == null
                                ? const AssetImage(AppImages.icUser)
                                : NetworkImage(
                                    controller.recipientUser!.profileUrlImage!,
                                  ) as ImageProvider,
                      ),
                    ),
                  ],
                ),
                onPressed: () => Modular.to.pop(),
              ),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(child: Text('1')),
                      PopupMenuItem(child: Text('2')),
                      PopupMenuItem(child: Text('3')),
                      PopupMenuItem(child: Text('4')),
                    ];
                  },
                ),
              ],
            ),
            resizeToAvoidBottomInset: true,
            bottomSheet: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: deviceSize.width * .75,
                    child: AppTextfield(
                      hint: 'Digite sua mensagem',
                      controller: controller.textMessageController,
                      borderColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send_sharp,
                        size: 20,
                        color: AppColors.darkWhite,
                      ),
                      onPressed: () => controller.sendNewMessage(),
                    ),
                  )
                ],
              ),
            ),

            body: Container(
              height: deviceSize.height,
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 70,
                left: 30,
                right: 30,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBlue
                    : AppColors.darkWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.messagesStream,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const EmptyMessageList();
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return const EmptyMessageList();
                  }

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemCount:
                        snapshot.data != null ? snapshot.data!.docs.length : 0,
                    itemBuilder: (context, index) {
                      if (snapshot.data != null) {
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        final message = model.Message.fromJson(
                            doc.data()! as Map<String, dynamic>);

                        return Message(
                          message: message,
                          currentUser:
                              controller.currentUserController.currentUser!,
                        );
                      }
                      return const SizedBox();
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
    required this.currentUser,
  }) : super(key: key);

  final model.Message message;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final isFromMe = message.sendyByUserDocumentId == currentUser.documentId;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment:
            isFromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            width: deviceSize.width * .6,
            // height: deviceSize.height * .06,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: message.content!,
                  fontColor: AppColors.darkWhite,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      text:
                          message.sendDate!.dateTimeToString(message.sendDate!),
                      fontSize: 13,
                      fontColor: AppColors.darkWhite,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
