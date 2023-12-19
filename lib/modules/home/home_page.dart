import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/models/chat/chat.dart';
import 'package:new_zap/modules/home/controller/home_controller.dart';
import 'package:new_zap/modules/home/widgets/app_message_item.dart';
import 'package:new_zap/modules/home/widgets/app_message_item_skeleton_loading.dart';
import 'package:new_zap/modules/home/widgets/app_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final controller = Modular.get<HomeController>();

  final routeArgs = Modular.args;

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    if (routeArgs.data != null) {
      final routeAuthUser =
          routeArgs.data[AppCollections.userDataArgumentKey] as User;
      controller.defineCurrentUser(routeAuthUser);
    }

    tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Observer(
        builder: (context) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(deviceSize.height * .15),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New ZapGo',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        IconButton(
                          icon: const Icon(
                            Icons.settings_outlined,
                            color: AppColors.darkWhite,
                            size: 30,
                          ),
                          onPressed: () => Modular.to
                              .pushNamed(Routes.userSettingsModuleRoute),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: const Icon(
                Icons.chat,
                color: AppColors.darkWhite,
              ),
              onPressed: () => Modular.to.pushNamed(Routes.contactsModuleRoute),
            ),
            body: Container(
              height: deviceSize.height - (deviceSize.height * .05),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondBlue.withOpacity(.7),
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: controller.status == HomeStatus.success
                  ? StreamBuilder<
                      Iterable<QueryDocumentSnapshot<Map<String, dynamic>>>>(
                      stream: controller.chatsStream,
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            TabBar(
                              controller: tabController,
                              indicatorColor:
                                  Theme.of(context).colorScheme.primary,
                              tabs: [
                                AppTab(
                                    tabTitle: 'Todas',
                                    tabBadge: snapshot.data != null
                                        ? snapshot.data!.length.toString()
                                        : ''),
                                const AppTab(tabTitle: 'Lidas', tabBadge: '0'),
                                const AppTab(
                                    tabTitle: 'Não lidas', tabBadge: '0'),
                              ],
                            ),
                            const SizedBox(height: 10),
                            snapshot.data != null
                                ? Expanded(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      separatorBuilder: (context, index) =>
                                          Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Divider(
                                          color: Colors.grey.withOpacity(.2),
                                          thickness: 1,
                                        ),
                                      ),
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        final chatList =
                                            snapshot.data!.toList();
                                        final chatItem = Chat.fromJson(
                                            chatList[index].data());

                                        return FutureBuilder(
                                          future: controller
                                              .findUserContactChatData(
                                            chat: chatItem,
                                            currentUserDocumentId: controller
                                                .currentUser
                                                .currentUser!
                                                .documentId!,
                                          ),
                                          builder: (context, userSnapshot) {
                                            final user = userSnapshot.data;

                                            return FutureBuilder(
                                              future:
                                                  controller.findUserMessages(
                                                      chat: chatItem),
                                              builder:
                                                  (context, messageSnapshot) {
                                                final message =
                                                    messageSnapshot.data;

                                                /// TODO:

                                                /// BLOQUEAR/DEBLOQ CTT
                                                /// FILTRAR USUARIO
                                                /// LISTAR CONVERSAS (NAO LIDAS, LIDAS)
                                                /// TENTAR NOTIFICACAO

                                                return AppMessageItem(
                                                  user: user,
                                                  message: message,
                                                  chat: chatItem,
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        );
                      },
                    )
                  : const AppMessageItemSkeletonLoading(),
            ),
          );
        },
      ),
    );
  }
}
