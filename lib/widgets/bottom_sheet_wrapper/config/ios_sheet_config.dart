import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSSheetConfig {
  final bool useRootNavigator;
  final RouteSettings? routeSettings;
  final Color barrierColor;
  final ImageFilter? filter;
  final bool barrierDismissible;
  final bool? semanticsDismissible;
  final Widget? title;

  const IOSSheetConfig({
    this.title,
    this.useRootNavigator = false,
    this.routeSettings,
    this.barrierColor = kCupertinoModalBarrierColor,
    this.barrierDismissible = true,
    this.filter,
    this.semanticsDismissible,
  });
}
