import 'package:e_commerce_app_widgets/widgets/bottom_sheet_wrapper/config/android_sheet_config.dart';
import 'package:e_commerce_app_widgets/widgets/bottom_sheet_wrapper/config/ios_sheet_config.dart';
import 'package:e_commerce_app_widgets/utils/platform_checking_utils/platform_checking_utils.dart';
import 'package:e_commerce_app_widgets/widgets/bottom_sheet_wrapper/widgets/bottom_sheet_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> showAdaptiveBottomSheet<T>({
  required BuildContext context,
  required List<BottomSheetAction> actions,
  required AndroidSheetConfig androidSheetConfig,
  required IOSSheetConfig iosSheetConfig,
  void Function()? onClose,
  void Function()? onDismissed,
  String? closeButtonText,
  TextStyle? closeButtonTextStyle,
  BorderRadius? bottomSheetRadius,
  Color? backgroundColor,
  double? width,
  double? height,
  TextAlign titleTextAlign = TextAlign.center,
}) async {
  if (PlatformCheckingUtils.isAndroid) {
    return _showMaterialBottomSheet<T>(
      context: context,
      actions: actions,
      closeButtonText: closeButtonText,
      closeButtonTextStyle: closeButtonTextStyle,
      androidSheetConfig: androidSheetConfig,
      onDismissed: onDismissed,
      onClose: onClose,
      bottomSheetRadius: bottomSheetRadius,
      width: width,
      height: height,
      titleTextAlign: titleTextAlign,
    );
  } else if (PlatformCheckingUtils.isIOS) {
    return _showCupertinoBottomSheet<T>(
      context: context,
      actions: actions,
      iosSheetConfig: iosSheetConfig,
      bottomSheetRadius: bottomSheetRadius,
      onClose: onClose,
      onDismissed: onDismissed,
      closeButtonTextStyle: closeButtonTextStyle,
      closeButtonText: closeButtonText,
      titleTextAlign: titleTextAlign,
    );
  }
}

Future<T?> _showCupertinoBottomSheet<T>({
  required BuildContext context,
  required List<BottomSheetAction> actions,
  required IOSSheetConfig iosSheetConfig,
  String? closeButtonText,
  TextStyle? closeButtonTextStyle,
  void Function()? onClose,
  void Function()? onDismissed,
  BorderRadius? bottomSheetRadius,
  Color? backgroundColor,
  TextAlign titleTextAlign = TextAlign.center,
  double? width,
  double? height,
}) {
  final defaultTextStyle = Theme.of(context).textTheme.headline6 ?? const TextStyle(fontSize: 20);
  return showCupertinoModalPopup(
    context: context,
    barrierColor: iosSheetConfig.barrierColor,
    barrierDismissible: iosSheetConfig.barrierDismissible,
    filter: iosSheetConfig.filter,
    routeSettings: iosSheetConfig.routeSettings,
    semanticsDismissible: iosSheetConfig.semanticsDismissible,
    useRootNavigator: iosSheetConfig.useRootNavigator,
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: bottomSheetRadius ??
            const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
        child: Container(
          color: backgroundColor ?? Colors.white,
          width: width,
          height: height,
          child: CupertinoActionSheet(
            title: iosSheetConfig.title,
            actions: actions.map((action) {
              /// Modal Popup doesn't inherited material widget
              /// so need to provide one in case trailing or
              /// leading widget require a Material widget ancestor.
              return Container(
                width: action.width,
                height: action.height,
                color: action.backgroundColor,
                child: Material(
                  color: Colors.transparent,
                  child: CupertinoActionSheetAction(
                    onPressed: action.onPressed,
                    child: Row(
                      children: [
                        if (action.leading != null) ...[
                          action.leading!,
                          const SizedBox(width: 16.0),
                        ],
                        Expanded(
                          child: DefaultTextStyle(
                            style: defaultTextStyle,
                            textAlign: titleTextAlign,
                            child: action.title,
                          ),
                        ),
                        if (action.trailing != null) ...[
                          const SizedBox(width: 8.0),
                          action.trailing!,
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
            cancelButton: onClose != null
                ? CupertinoActionSheetAction(
                    onPressed: () {
                      onClose.call();
                      Navigator.of(context).pop();
                    },
                    child: DefaultTextStyle(
                      style: closeButtonTextStyle ?? defaultTextStyle.copyWith(color: Colors.lightBlue),
                      textAlign: TextAlign.center,
                      child: Text(closeButtonText ?? 'Close'),
                    ),
                  )
                : null,
          ),
        ),
      );
    },
  ).then((value) {
    onDismissed?.call();
  });
}

Future<T?> _showMaterialBottomSheet<T>({
  required BuildContext context,
  required List<BottomSheetAction> actions,
  required AndroidSheetConfig androidSheetConfig,
  void Function()? onClose,
  void Function()? onDismissed,
  BorderRadius? bottomSheetRadius,
  String? closeButtonText,
  TextStyle? closeButtonTextStyle,
  Color? backgroundColor,
  TextAlign titleTextAlign = TextAlign.center,
  double? width,
  double? height,
}) {
  final defaultTextStyle = Theme.of(context).textTheme.headline6 ?? const TextStyle(fontSize: 20);
  return showModalBottomSheet<T>(
    context: context,
    elevation: 0,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: androidSheetConfig.barrierColor,
    useRootNavigator: androidSheetConfig.useRootNavigator,
    routeSettings: androidSheetConfig.routeSettings,
    constraints: androidSheetConfig.constraints,
    enableDrag: androidSheetConfig.enableDrag,
    clipBehavior: androidSheetConfig.clipBehavior,
    isDismissible: androidSheetConfig.isDismissible,
    transitionAnimationController: androidSheetConfig.transitionAnimationController,
    builder: (BuildContext context) {
      final double screenHeight = MediaQuery.of(context).size.height;
      return ClipRRect(
        borderRadius: bottomSheetRadius ??
            const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
        child: Container(
          width: width,
          height: height,
          color: backgroundColor ?? Colors.white,
          constraints: BoxConstraints(
            maxHeight: screenHeight - (screenHeight / 10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (androidSheetConfig.title != null) ...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: androidSheetConfig.title),
                  ),
                ],
                ...actions.map<Widget>((action) {
                  return Container(
                    color: action.backgroundColor,
                    width: action.width,
                    height: action.height,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: action.onPressed,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              if (action.leading != null) ...[
                                Expanded(child: action.leading!),
                              ] else
                                const Expanded(child: SizedBox()),
                              Expanded(
                                child: DefaultTextStyle(
                                  style: defaultTextStyle,
                                  textAlign: titleTextAlign,
                                  child: action.title,
                                ),
                              ),
                              if (action.trailing != null) ...[
                                Expanded(child: action.trailing!),
                              ] else
                                const Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                if (onClose != null)
                  InkWell(
                    onTap: () {
                      onClose.call();
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DefaultTextStyle(
                          style: defaultTextStyle.copyWith(color: Colors.lightBlue),
                          textAlign: TextAlign.center,
                          child: Text(
                            closeButtonText ?? 'Close',
                            style: closeButtonTextStyle ?? defaultTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    },
  ).then((value) {
    onDismissed?.call();
  });
}
