import 'package:flutter/material.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/widgets/app_text.dart';

Future<void> showBlockedDialogContact(BuildContext context) async {
  final deviceSize = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      height: deviceSize.height * .7,
      width: deviceSize.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 5,
            width: deviceSize.width * .3,
            margin:const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey
            ),
          ),
          
          Container(
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 45,
                          width: 45,
                          child: CircleAvatar(
                            // backgroundImage: NetworkImage(user.profileUrlImage!) as ImageProvider,
                            backgroundImage: AssetImage(AppImages.icUser),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: 'user.name',
                              fontColor: AppColors.darkBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            AppText(
                              text: 'user.email',
                              fontColor: AppColors.darkBlue,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
