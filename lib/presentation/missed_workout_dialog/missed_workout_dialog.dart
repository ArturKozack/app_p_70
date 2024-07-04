import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart';

class MissedWorkoutDialog extends StatelessWidget {
  const MissedWorkoutDialog({Key? key}) : super(key: key);

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
        "You missed a scheduled workout. You will be credited with 60 points.",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: CustomTextStyles.bodySmallSecondaryContainer.copyWith(
          height: 1.33,
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
