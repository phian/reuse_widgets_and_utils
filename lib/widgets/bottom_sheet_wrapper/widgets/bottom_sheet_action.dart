import 'package:flutter/material.dart';

/// The Actions model that will use on the ActionSheet.
class BottomSheetAction {
  /// The primary content of the action sheet.
  ///
  /// Typically a [Text] widget.
  ///
  /// This should not wrap. To enforce the single line limit, use
  /// [Text.maxLines].
  final Widget title;

  /// The callback that is called when the action item is tapped. (required)
  final VoidCallback onPressed;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] widget.
  final Widget? trailing;

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar] widget.
  final Widget? leading;

  /// The background [Color] for the item.
  ///
  /// If null, the background color of the item will be [Colors.transparent]
  final Color? backgroundColor;

  final double? width;

  final double? height;

  BottomSheetAction({
    required this.title,
    required this.onPressed,
    this.trailing,
    this.leading,
    this.backgroundColor,
    this.width,
    this.height,
  });
}