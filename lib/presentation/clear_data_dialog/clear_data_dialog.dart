import 'package:app_p_70/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_p_70/core/app_export.dart';

class ClearDataDialog extends StatelessWidget {
  const ClearDataDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: appTheme.gray5001,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      title: SizedBox(
        width: double.maxFinite,
        child: Text(
          localizations.deleteAllAppCache.toUpperCase(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.titleLargePrimaryContainer_1.copyWith(
            height: 1.27,
          ),
        ),
      ),
      content: Text(
        localizations.deleteAppCacheWarning,
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
            localizations.cancel,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context, AppStrings.delete),
          child: Padding(
            padding: EdgeInsets.only(left: 32.h),
            child: Text(
              localizations.delete,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}
