import 'package:flutter/material.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/widgets/app_text.dart';

class AppMessageItem extends StatelessWidget {
  const AppMessageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(),
              ),
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Contact name',
                    fontColor: Colors.black,
                    fontSize: 18,
                  ),
                  AppText(
                    text: 'Message',
                    fontColor: Colors.black,
                    fontSize: 13,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: '18:30',
                fontColor: Colors.black,
                fontSize: 13,
              ),
              Container(
                width: 25,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColors.blue.withOpacity(.8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: AppText(
                    text: '5',
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
