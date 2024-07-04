import 'package:app_p_70/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart';

class ClearDataDialog extends StatelessWidget {
  const ClearDataDialog({Key? key}) : super(key: key);

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
          "Delete all app cache?".toUpperCase(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.titleLargePrimaryContainer_1.copyWith(
            height: 1.27,
          ),
        ),
      ),
      content: Text(
        "All your data will be lost,\nbeyond recovery",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: CustomTextStyles.bodySmallSecondaryContainer.copyWith(
          height: 1.33,
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        InkWell(
          onTap: () => Navigator.pop(context, AppStrings.cancel),
          child: Text(
            "Cancel",
            style: theme.textTheme.bodyLarge,
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context, AppStrings.delete),
          child: Padding(
            padding: EdgeInsets.only(left: 32.h),
            child: Text(
              "Delete",
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}
