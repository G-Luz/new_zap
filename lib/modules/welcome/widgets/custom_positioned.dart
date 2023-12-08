import 'package:flutter/widgets.dart';

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({
    Key? key,
    this.size = 120,
    required this.child,
  }) : super(key: key);

  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
