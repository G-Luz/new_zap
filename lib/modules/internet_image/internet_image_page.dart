import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/modules/internet_image/controller/internet_image_controller.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:new_zap/widgets/app_textfield.dart';
import 'package:new_zap/widgets/toast.dart';

class InternetImagePage extends StatefulWidget {
  const InternetImagePage({Key? key}) : super(key: key);

  @override
  _InternetImagePageState createState() => _InternetImagePageState();
}

class _InternetImagePageState extends State<InternetImagePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<InternetImageController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
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
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.topCenter,
        child: Observer(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: AppTextfield(
                    hint: 'Pesquise por uma imagem',
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                    onChanged: (filter) =>
                        controller.searchNetworkImage(filter),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 200 / 170,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 80,
                    ),
                    itemCount: controller.imageList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          if (controller.imageList[index].regular != null ||
                              controller.imageList[index].full != null) {
                            final downloadedImagePath =
                                await controller.downloadNetworkImage(
                                    controller.imageList[index].regular ??
                                        controller.imageList[index].full);
                            if (downloadedImagePath != null) {
                              Modular.to.pop(downloadedImagePath);
                            } else {
                              showToast(
                                'Não foi possível baixar a imagem. Tente novamente.',
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      controller.imageList[index].regular ??
                                          controller.imageList[index].full ??
                                          ''),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}
