import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore_for_file: must_be_immutable

class SelectDaysDialog extends StatelessWidget {
  const SelectDaysDialog({Key? key})
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
                    "Choose the days for training in the settings",
                    maxLines: 2,
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
                        "Select days",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.v)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
