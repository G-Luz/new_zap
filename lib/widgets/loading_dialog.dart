import 'package:flutter/material.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/widgets/app_text.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CircularProgressIndicator(
          color: AppColors.blue,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const AppText(
            text: 'Carregando...',
            fontSize: 18,
            fontColor: AppColors.darkBlue,
          ),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
