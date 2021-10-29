import 'package:e_commerce_app_widgets/widgets/suggestion_overlay/widgets/suggestion_overlay_item.dart';
import 'package:e_commerce_app_widgets/widgets/suggestion_overlay/widgets/suggestion_overlay_title.dart';
import 'package:flutter/material.dart';

class TextFieldSuggestionOverlay extends StatefulWidget {
  const TextFieldSuggestionOverlay({
    Key? key,
    required this.items,
    required this.textFieldController,
    required this.child,
    required this.textFieldFocusNode,
    required this.textFieldKey,
    this.showTitle = true,
    this.title,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownOffset,
    this.dropdownConstraints,
    this.dropdownColor,
    this.dropdownRadius,
    this.dropdownBorder,
    this.dropdownShadow,
  }) : super(key: key);

  final List<SuggestionOverlayItem> items;
  final TextEditingController textFieldController;
  final Widget child;
  final FocusNode textFieldFocusNode;
  final bool showTitle;
  final SuggestionTitle? title;
  final GlobalKey<EditableTextState> textFieldKey;
  final Offset? dropdownOffset;
  final double? dropdownHeight;
  final double? dropdownWidth;
  final BoxConstraints? dropdownConstraints;
  final Color? dropdownColor;
  final BorderRadius? dropdownRadius;
  final BoxBorder? dropdownBorder;
  final List<BoxShadow>? dropdownShadow;

  @override
  _TextFieldSuggestionOverlayState createState() => _TextFieldSuggestionOverlayState();
}

class _TextFieldSuggestionOverlayState extends State<TextFieldSuggestionOverlay> with SingleTickerProviderStateMixin {
  late final TextEditingController _controller = widget.textFieldController;
  late final FocusNode _focusNode = widget.textFieldFocusNode;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.isNotEmpty && _focusNode.hasFocus) {
        _closeOverlay();
        _showOverlay();
      }
      if (_controller.text.isEmpty) {
        _closeOverlay();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    WidgetsBinding.instance?.addPostFrameCallback((_) => Overlay.of(context)?.insert(_overlayEntry!));
  }

  void _closeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    // find the size and position of the current widget
    RenderBox? renderBox = widget.textFieldKey.currentContext!.findRenderObject() as RenderBox?;
    var size = renderBox?.size ?? Size.zero;

    var offset = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
    var topOffset = offset.dy + size.height + 5.0;

    return OverlayEntry(
      // Full screen GestureDetector to register when a
      // User has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () {
          _closeOverlay();
        },
        behavior: HitTestBehavior.translucent,
        // full screen container to register taps anywhere and close drop down
        child: Stack(
          children: [
            Positioned(
              left: offset.dx,
              top: topOffset,
              width: widget.dropdownWidth ?? size.width,
              child: CompositedTransformFollower(
                offset: widget.dropdownOffset ?? Offset(0, size.height + 5),
                link: _layerLink,
                child: Material(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    constraints: widget.dropdownConstraints,
                    height: widget.dropdownHeight,
                    decoration: BoxDecoration(
                      color: widget.dropdownColor ?? Colors.white,
                      borderRadius: widget.dropdownRadius ?? BorderRadius.circular(8.0),
                      border: widget.dropdownBorder ??
                          Border.all(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                      boxShadow: widget.dropdownShadow,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.title ?? const SizedBox(),
                        ...widget.items,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
