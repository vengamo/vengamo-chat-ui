import 'package:flutter/material.dart';

/// Get screen media.
final MediaQueryData media =
    MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single);

/// This extention help us to make widget responsive.
extension NumberParsing on num {
  double w() => this * media.size.width / 100;

  double h() => this * media.size.height / 100;
}
