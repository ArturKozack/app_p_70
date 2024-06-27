import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class StartTrainingDialog extends StatelessWidget {
  const StartTrainingDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
          child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(24.h),
              decoration: AppDecoration.backgroundBackground1.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notification".toUpperCase(),
                    style: CustomTextStyles.titleLargePrimaryContainer_1,
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    "It's time to start training!",
                    style: CustomTextStyles.bodySmallSecondaryContainer,
                  ),
                  SizedBox(height: 34.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.h),
                      child: Text(
                        "Start",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.v)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
