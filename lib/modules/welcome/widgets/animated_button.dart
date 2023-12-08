import 'package:flutter/cupertino.dart';
import 'package:new_zap/constants/app_colors.dart';
import 'package:new_zap/constants/app_images.dart';
import 'package:new_zap/widgets/app_text.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    Key? key,
    required this.title,
    required RiveAnimationController animationController,
    required this.reverseWidgets,
    required this.onPressedCallback,
  })  : _animationController = animationController,
        super(key: key);

  final String title;
  final RiveAnimationController _animationController;
  final bool reverseWidgets;
  final VoidCallback onPressedCallback;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressedCallback,
      child: SizedBox(
        height: deviceSize.height * .1,
        width: deviceSize.width * .8,
        child: Stack(
          children: [
            RiveAnimation.asset(
              AppImages.riveButton,
              controllers: [_animationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: reverseWidgets
                    ? [
                        const Icon(CupertinoIcons.arrow_right),
                        const SizedBox(width: 12),
                        AppText(
                          text: title,
                          fontColor: AppColors.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ]
                    : [
                        AppText(
                          text: title,
                          fontColor: AppColors.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(width: 12),
                        const Icon(CupertinoIcons.arrow_left),
                      ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
