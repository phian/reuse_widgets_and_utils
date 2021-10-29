import 'package:flutter/material.dart';

typedef TitleBuilder = Widget Function(BuildContext context);

class SuggestionTitle extends StatelessWidget {
  const SuggestionTitle({
    Key? key,
    required this.title,
    this.action,
    this.showAction = true,
  }) : super(key: key);

  final Widget title;
  final Widget? action;
  final bool showAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: title),
        Expanded(
          child: Visibility(
            visible: showAction,
            child: action ?? const SizedBox(),
          ),
        ),
      ],
    );
  }
}
