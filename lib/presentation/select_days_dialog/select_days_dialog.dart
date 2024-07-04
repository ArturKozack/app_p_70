import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart'; // ignore_for_file: must_be_immutable

class SelectDaysDialog extends StatelessWidget {
  const SelectDaysDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appTheme.gray5001,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      title: SizedBox(
        width: double.maxFinite,
        child: Text(
          "Notification".toUpperCase(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.titleLargePrimaryContainer_1.copyWith(
            height: 1.27,
          ),
        ),
      ),
      content: Text(
        "Choose the days for training in the settings",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: CustomTextStyles.bodySmallSecondaryContainer.copyWith(
          height: 1.33,
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        InkWell(
          onTap: () =>
              Navigator.popAndPushNamed(context, AppRoutes.onboardingTimerScreen),
          child: Text(
            "Select Days",
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
