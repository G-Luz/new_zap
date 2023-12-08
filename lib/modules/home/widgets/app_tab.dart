import 'package:flutter/material.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/widgets/app_text.dart';

class AppTab extends StatelessWidget {
  const AppTab({
    Key? key,
    required this.tabTitle,
    required this.tabBadge,
  }) : super(key: key);

  final String tabTitle;
  final String tabBadge;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: tabTitle,
            fontColor: AppColors.darkBlue,
          ),
          const SizedBox(width: 10),
          Container(
            width: 25,
            height: 18,
            decoration: BoxDecoration(
              color: AppColors.darkBlue.withOpacity(.8),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Center(
              child: AppText(
                text: tabBadge,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
