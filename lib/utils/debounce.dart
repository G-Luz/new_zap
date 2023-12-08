import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  final Duration delay;
  Timer? timer;

  Debouncer({
    required this.delay,
    this.timer,
  });

  run(VoidCallback action) {
    timer?.cancel();
    timer = Timer(delay, action);
  }
}
