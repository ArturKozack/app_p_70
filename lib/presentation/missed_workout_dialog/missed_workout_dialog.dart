import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class MissedWorkoutDialog extends StatelessWidget {
  const MissedWorkoutDialog({Key? key})
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
                  SizedBox(height: 18.v),
                  Text(
                    "You missed a scheduled workout. You will be credited with 60 points.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:
                        CustomTextStyles.bodySmallSecondaryContainer.copyWith(
                      height: 1.33,
                    ),
                  ),
                  SizedBox(height: 34.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.h),
                      child: Text(
                        "Cancel",
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
