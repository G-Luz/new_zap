import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:new_zap/widgets/app_textfield.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: AppText(
          text: 'Contact name',
          fontSize: 17,
        ),
        leadingWidth: 75,
        leading: IconButton(
          highlightColor: Colors.grey.withOpacity(.2),
          icon: Row(
            children: [
              Icon(
                CupertinoIcons.arrow_left,
                color: AppColors.darkWhite,
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 30,
                height: 30,
                child: CircleAvatar(),
              ),
            ],
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.darkWhite,
            ),
            highlightColor: Colors.grey.withOpacity(.2),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: AppColors.darkWhite,
            ),
            highlightColor: Colors.grey.withOpacity(.2),
            onPressed: () {},
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      bottomSheet: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: AppColors.darkWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: deviceSize.width * .75,
              child: AppTextfield(hint: 'Digite sua mensagem'),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.darkBlue,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.send_sharp,
                  size: 20,
                  color: AppColors.darkWhite,
                ),
                onPressed: () {},
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
        decoration: const BoxDecoration(
          color: AppColors.darkWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          reverse: true,
          itemCount: 100,
          itemBuilder: (context, index) {
            return Message(isFromMe: index % 2 == 0, index: index);
          },
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.isFromMe,
    required this.index,
  }) : super(key: key);

  final bool isFromMe;
  final int index;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment:
          isFromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: deviceSize.width * .4,
          height: deviceSize.height * .06,
          padding: const EdgeInsets.only(left: 10, right: 7, top: 5),
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
                text: 'message $index',
                fontColor: AppColors.darkWhite,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText(
                    text: '15:30',
                    fontSize: 13,
                    fontColor: AppColors.darkWhite,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
