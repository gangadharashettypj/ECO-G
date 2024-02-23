/*
 * @Author GS
 */
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:flutter_game/gen/colors.gen.dart';

import 'loading_animation_controller.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool expanded;
  final bool enabled;
  final String title;
  final Color color;
  final Color borderColor;
  final Color loaderColor;
  final bool borderEnabled;
  final Color backgroundColor;
  final double loaderSize;
  final double height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextDecoration? textDecoration;
  final TextDecorationStyle? textDecorationStyle;
  final double? fontSize;
  final double borderRadius;
  final Widget? prefix, suffix;
  final EdgeInsets? prefixPadding;
  final FontWeight? fontWeight;
  final ButtonLoadingAnimationController? controller;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.expanded = true,
    this.loaderColor = Colors.white,
    this.padding,
    this.color = Colors.white,
    this.backgroundColor = ColorName.primary,
    this.margin,
    this.borderRadius = 4,
    this.loaderSize = 24,
    this.enabled = true,
    this.borderEnabled = false,
    this.textDecoration,
    this.textDecorationStyle,
    this.fontSize = 16,
    this.borderColor = ColorName.textDarkColor,
    this.prefix,
    this.suffix,
    this.height = 42,
    this.fontWeight,
    this.prefixPadding,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 24),
      child: getButtonWidget(),
    );
  }

  Widget getButtonWidget() {
    return Watch((context) {
      return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: SizedBox(
          height: height,
          child: Container(
            height: height,
            padding: padding ??
                (expanded
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(horizontal: 32)),
            decoration: BoxDecoration(
              color:
                  enabled ? backgroundColor : backgroundColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(169, 176, 185, 0.42),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              border: borderEnabled
                  ? Border.all(
                      color: ColorName.textDarkColor,
                    )
                  : null,
            ),
            child: (controller != null && controller!.showLoading)
                ? Row(
                    mainAxisSize:
                        expanded ? MainAxisSize.max : MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              loaderColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisSize:
                        expanded ? MainAxisSize.max : MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (prefix != null)
                        Padding(
                          padding:
                              prefixPadding ?? const EdgeInsets.only(right: 10),
                          child: prefix!,
                        ),
                      Text(
                        title,
                        style: TextStyle(
                          color: color,
                          fontSize: fontSize,
                          fontWeight: fontWeight ?? FontWeight.w600,
                        ),
                      ),
                      if (suffix != null)
                        Padding(
                          padding:
                              prefixPadding ?? const EdgeInsets.only(left: 10),
                          child: suffix!,
                        ),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
