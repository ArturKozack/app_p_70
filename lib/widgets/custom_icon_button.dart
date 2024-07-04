import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
        borderRadius: BorderRadius.circular(36.h),
      );

  static BoxDecoration get fillOnActive => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(36.h),
      );
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {Key? key,
      this.alignment,
      this.height,
      this.width,
      this.padding,
      this.decoration,
      this.child,
      this.onTap})
      : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center, child: iconButtonWidget)
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(20.h),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black90026.withOpacity(0.1),
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: Offset(
                        0,
                        0,
                      ),
                    )
                  ],
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}
