import 'package:flutter/material.dart';
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
                  // AppText(
                  //   text: 'Contact name',
                  //   fontColor: Colors.black,
                  //   fontSize: 18,
                  // ),
                  // AppText(
                  //   text: 'Message',
                  //   fontColor: Colors.black,
                  //   fontSize: 13,
                  // ),
                  Text(
                    'Contact name',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Message',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '18:30',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 5),
              Container(
                width: 25,
                height: 18,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: AppText(
                    text: '5',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
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
