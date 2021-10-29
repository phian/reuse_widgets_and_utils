import 'package:flutter/material.dart';

class AndroidSheetConfig {
  final Widget? title;
  final bool isDismissible;
  final bool isScrollControlled;
  final bool useRootNavigator;
  final RouteSettings? routeSettings;
  final AnimationController? transitionAnimationController;
  final Color? barrierColor;
  final BorderRadius? borderRadius;
  final BoxConstraints? constraints;
  final bool enableDrag;
  final void Function(DragStartDetails dragStartDetails)? onDragStart;
  final void Function(DragEndDetails, {required bool isClosing})? onDragEnd;
  final Clip? clipBehavior;

  const AndroidSheetConfig({
    this.title,
    this.isDismissible = true,
    this.isScrollControlled = false,
    this.useRootNavigator = false,
    this.routeSettings,
    this.transitionAnimationController,
    this.barrierColor,
    this.borderRadius,
    this.constraints,
    this.onDragStart,
    this.onDragEnd,
    this.enableDrag = true,
    this.clipBehavior,
  });
}
