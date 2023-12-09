import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/modules/contacts/contact_item_skeleton_loading.dart';
import 'package:new_zap/modules/contacts/controller/contacts_controller.dart';
import 'package:new_zap/modules/contacts/widgets/contact_item.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:new_zap/widgets/app_textfield.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final controller = Modular.get<ContactsController>();

  @override
  void initState() {
    super.initState();
    controller.retrieveContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkBlue
              : AppColors.darkWhite,
          appBar: AppBar(
            backgroundColor: AppColors.darkBlue,
            title: controller.isSearchContact
                ? Row(
                    children: [AppTextfield()],
                  )
                : AppText(
                    text: 'Contatos do ZapGo',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            leading: IconButton(
              icon: Icon(
                CupertinoIcons.arrow_left,
                color: AppColors.darkWhite,
              ),
              onPressed: () => Modular.to.pop(),
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
            ],
          ),
          body: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.status == ContactsStatus.loading
                ? 50
                : controller.contactsList.isEmpty
                    ? 0
                    : controller.contactsList.length,
            itemBuilder: (context, index) {
              if (controller.status == ContactsStatus.loading) {
                return const ContactItemSkeletonLoading();
              }
              return ContactItem(
                user: controller.contactsList[index],
                contactsController: controller,
              );
            },
          ),
        );
      },
    );
  }
}
