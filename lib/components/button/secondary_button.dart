import 'package:flutter/material.dart';
import 'package:flutter_game/components/button/loading_animation_controller.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/gen/colors.gen.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onPressed;
  final Widget? prefix, suffix;
  final Color color;
  final Color? backGroundColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final double borderRadius;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final EdgeInsets? prefixPadding;
  final EdgeInsets? suffixPadding;
  final ButtonLoadingAnimationController? controller;

  const SecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.prefix,
    this.suffix,
    this.color = ColorName.primary,
    this.fontSize,
    this.fontWeight,
    this.borderRadius = 4,
    this.padding,
    this.height,
    this.width,
    this.prefixPadding,
    this.suffixPadding,
    this.backGroundColor,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: color),
        ),
        child: (controller != null && controller!.showLoading)
            ? const CircularProgressIndicator()
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefix != null)
                    Padding(
                      padding: prefixPadding ?? const EdgeInsets.only(right: 5),
                      child: prefix!,
                    ),
                  LabelWidget(
                    title,
                    labelType: LabelType.normal,
                    fontSize: fontSize,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    color: color,
                  ),
                  if (suffix != null)
                    Padding(
                      padding: suffixPadding ?? const EdgeInsets.only(left: 5),
                      child: suffix!,
                    ),
                ],
              ),
      ),
    );
  }
}
