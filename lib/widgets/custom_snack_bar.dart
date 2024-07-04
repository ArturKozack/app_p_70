import 'package:app_p_70/core/app_export.dart';
import 'package:app_p_70/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomSnackBar extends SnackBar {
  final String text;
  final Color color;

  CustomSnackBar({
    super.key,
    required this.text,
    required this.color,
  }) : super(
          content: Builder(
            builder: (context) => Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: appTheme.whiteA700),
            ),
          ),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 8.v, horizontal: 16.h),
          duration: const Duration(seconds: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          animation: CurvedAnimation(
            parent: AnimationController(
              vsync: TestVSync(),
              duration: const Duration(milliseconds: 3),
            ),
            curve: Curves.easeOutCirc,
          ),
        );

  factory CustomSnackBar.success(text) {
    return CustomSnackBar(
      text: text,
      color: appTheme.lightGreen400
    );
  }

  factory CustomSnackBar.error() {
    return CustomSnackBar(
      text: AppStrings.errorOccured,
      color: appTheme.red600,
    );
  }
}

class TestVSync extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
