import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/home/controller/home_controller.dart';
import 'package:new_zap/modules/home/widgets/app_message_item.dart';
import 'package:new_zap/modules/home/widgets/app_tab.dart';
import 'package:new_zap/widgets/app_text.dart';

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
      controller.currentUser.defineCurrentUser(routeAuthUser);
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
                padding: EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('New ZapGo'),
                    Row(
                      children: [
                        const Icon(
                          Icons.search_outlined,
                          color: AppColors.darkWhite,
                          size: 30,
                        ),
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
              backgroundColor: AppColors.darkBlue,
              label: const Icon(
                Icons.chat,
                color: AppColors.darkWhite,
              ),
              // onPressed: () => Modular.to.pushNamed(Routes.contactsModuleRoute),
              onPressed: () => controller.theme.changeTheme(),
            ),
            body: Container(
              height: deviceSize.height - (deviceSize.height * .05),
              decoration: BoxDecoration(
                // color: AppColors.darkWhite,
                color: Theme.of(context).colorScheme.background,

                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.indigo[900],
                    tabs: const [
                      AppTab(tabTitle: 'Todas', tabBadge: '10'),
                      AppTab(tabTitle: 'Lidas', tabBadge: '2'),
                      AppTab(tabTitle: 'Não lidas', tabBadge: '8'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          color: Colors.grey.withOpacity(.2),
                          thickness: 1,
                        ),
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return AppMessageItem();
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
