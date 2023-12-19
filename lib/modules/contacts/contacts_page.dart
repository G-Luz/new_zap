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
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkBlue
                : AppColors.darkWhite,
            appBar: AppBar(
              backgroundColor: AppColors.darkBlue,
              title: controller.isOpenSearchBar
                  ? Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: deviceSize.width * .7,
                          child: AppTextfield(
                            hint: 'Pesquise por nome ou email',
                            borderColor: AppColors.yellow,
                            onChanged: (filter) =>
                                controller.searchFilteredContacts(
                              filter.toLowerCase(),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const AppText(
                      text: 'Contatos do ZapGo',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
              leading: IconButton(
                icon: const Icon(
                  CupertinoIcons.arrow_left,
                  color: AppColors.darkWhite,
                ),
                onPressed: () => controller.isOpenSearchBar
                    ? controller.handleSearchContactBar()
                    : Modular.to.pop(),
              ),
              actions: [
                controller.isOpenSearchBar
                    ? const SizedBox()
                    : IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.darkWhite,
                        ),
                        highlightColor: Colors.grey.withOpacity(.2),
                        onPressed: () => controller.handleSearchContactBar(),
                      ),
              ],
            ),
            body: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.status == ContactsStatus.loading
                  ? 50
                  : controller.filterCttList.isNotEmpty
                      ? controller.filterCttList.length
                      : controller.contactsList.length,
              itemBuilder: (context, index) {
                if (controller.status == ContactsStatus.loading) {
                  return const ContactItemSkeletonLoading();
                }
                return ContactItem(
                  user: controller.filterCttList.isNotEmpty
                      ? controller.filterCttList[index]
                      : controller.contactsList[index],
                  contactsController: controller,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
