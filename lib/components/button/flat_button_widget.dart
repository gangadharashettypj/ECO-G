/*
 * @Author GS
 */
import 'package:flutter/material.dart';
import 'package:flutter_game/gen/colors.gen.dart';

import 'loading_animation_controller.dart';

class FlatButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool expanded;
  final bool underlined;
  final String title;
  final Color color;
  final EdgeInsets padding;
  final TextDecoration? textDecoration;
  final TextDecorationStyle? textDecorationStyle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final ButtonLoadingAnimationController? controller;
  final Alignment? alignment;
  final Widget? prefix, suffix;
  final ButtonStyle? style;

  const FlatButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.expanded = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 32),
    this.color = ColorName.primary,
    this.textDecoration,
    this.alignment,
    this.textDecorationStyle,
    this.fontSize,
    this.fontWeight,
    this.controller,
    this.underlined = false,
    this.prefix,
    this.suffix,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return getButtonWidget();
    } else {
      return Align(
        alignment: alignment ?? Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            getButtonWidget(),
          ],
        ),
      );
    }
  }

  Widget getButtonWidget() {
    return TextButton(
      onPressed: onPressed,
      style: style,
      child: (controller != null && controller!.showLoading)
          ? const CircularProgressIndicator()
          : Container(
              padding: padding,
              decoration: underlined
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: color,
                          width: 2,
                        ),
                      ),
                    )
                  : null,
              child: Row(
                mainAxisSize: expanded ? MainAxisSize.min : MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefix != null) prefix!,
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontWeight: fontWeight ?? FontWeight.w600,
                      fontSize: fontSize ?? 16,
                      decoration: textDecoration,
                      decorationStyle: textDecorationStyle,
                      decorationThickness: 3,
                    ),
                  ),
                  if (suffix != null) suffix!,
                ],
              ),
            ),
    );
  }
}
