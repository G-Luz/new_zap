import 'package:flutter/material.dart';

class EmptyMessageList extends StatelessWidget {
  const EmptyMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary.withOpacity(.3),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Ainda não existem mensagens nesta conversa.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
