import 'package:flutter/material.dart';

class SimpleContainer extends StatelessWidget {
  const SimpleContainer({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.color,
    this.shadowColor = const Color(0xFF000000),
    this.shadowBlurRadius = 0.0,
    this.shadowSpreadRadius = 0.0,
    this.shadowOffset = Offset.zero,
    this.boxShadow,
    this.borderRadius,
    this.padding,
    this.margin,
    this.constraints,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final double? width;
  final double? height;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      constraints: constraints,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: shadowColor,
                blurRadius: shadowBlurRadius,
                spreadRadius: shadowSpreadRadius,
                offset: shadowOffset,
              ),
            ],
      ),
      child: child,
    );
  }
}
