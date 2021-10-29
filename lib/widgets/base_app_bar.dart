import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
    this.title,
    this.canBack = true,
    this.centerTitle = true,
    this.actions,
    this.onBackPressed,
    this.backgroundColor,
    this.elevation,
    this.leading,
    this.appBarSize,
  }) : super(key: key);

  final Widget? title;
  final bool canBack;
  final List<Widget>? actions;
  final bool centerTitle;
  final void Function()? onBackPressed;
  final Color? backgroundColor;
  final double? elevation;
  final Widget? leading;
  final Size? appBarSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: () {
        if (leading != null) {
          return leading;
        } else {
          if (canBack) {
            return IconButton(
              onPressed: () {
                if (onBackPressed != null) {
                  onBackPressed?.call();
                  return;
                }
                Navigator.of(context).pop();
              },
              color: Colors.white,
              icon: const Icon(Icons.arrow_back_ios, size: 20.0),
            );
          } else {
            return null;
          }
        }
      }(),
    );
  }

  @override
  Size get preferredSize => appBarSize ?? Size(AppBar().preferredSize.width, AppBar().preferredSize.height);
}
