import 'package:flutter/material.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/contacts/controller/contacts_controller.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:new_zap/widgets/toast.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    Key? key,
    required this.user,
    required this.contactsController,
  }) : super(key: key);

  final User user;
  final ContactsController contactsController;

  @override
  Widget build(BuildContext context) {
    final isMyCurrentUser =
        contactsController.currentUserController.currentUser == user;
    return InkWell(
      splashColor: Colors.grey.withOpacity(.1),
      highlightColor: Colors.grey.withOpacity(.1),
      onTap: isMyCurrentUser
          ? () {
              showToast('Não é possível selecionar o próprio contato.');
            }
          : () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
            color: isMyCurrentUser
                ? AppColors.blue.withOpacity(.1)
                : Colors.transparent),
        child: Row(
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: CircleAvatar(
                backgroundImage: user.profileUrlImage == null
                    ? const AssetImage(AppImages.icUser)
                    : NetworkImage(user.profileUrlImage!) as ImageProvider,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isMyCurrentUser ? '${user.name} (Meu contato)' : user.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  // fontColor: AppColors.darkBlue,
                  // fontSize: 16,
                  // fontWeight: FontWeight.w700,
                ),
                Text(
                  user.lastEntrance?.toString() ?? 'Login ainda não efetuado.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
