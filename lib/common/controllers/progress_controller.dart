import 'package:flutter/material.dart';

class ProgressController {
  VoidCallback? startAnimation;
  VoidCallback? resetAnimation;

  void dispose() {
    startAnimation = null;
    resetAnimation = null;
  }
}
