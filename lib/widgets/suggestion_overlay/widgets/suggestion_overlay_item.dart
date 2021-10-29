import 'package:e_commerce_app_widgets/widgets/inkwell_wrapper.dart';
import 'package:flutter/material.dart';

class SuggestionOverlayItem extends StatefulWidget {
  const SuggestionOverlayItem({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
    this.canClose = true,
    this.onTap,
    this.onClosed,
    this.backgroundColor,
    this.itemRadius,
  }) : super(key: key);

  final Widget? leading;
  final Widget title;
  final Widget? trailing;
  final bool canClose;
  final void Function()? onTap;
  final void Function()? onClosed;
  final Color? backgroundColor;
  final BorderRadius? itemRadius;

  @override
  State<SuggestionOverlayItem> createState() => _SuggestionOverlayItemState();
}

class _SuggestionOverlayItemState extends State<SuggestionOverlayItem> {
  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      color: widget.backgroundColor ?? Colors.transparent,
      onTap: widget.onTap,
      borderRadius: widget.itemRadius ?? BorderRadius.zero,
      child: Row(
        children: [
          Expanded(child: widget.leading ?? const SizedBox()),
          Expanded(child: widget.title),
          Expanded(
            child: () {
              if (widget.trailing != null) {
                return widget.trailing!;
              } else {
                if (widget.canClose) {
                  return IconButton(
                    onPressed: widget.onClosed,
                    icon: const Icon(Icons.close, size: 30.0),
                  );
                } else {
                  return const SizedBox();
                }
              }
            }(),
          ),
        ],
      ),
    );
  }
}
