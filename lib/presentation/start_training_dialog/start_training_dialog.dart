import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartTrainingDialog extends StatelessWidget {
  final Function() onStartTraining;

  const StartTrainingDialog({
    Key? key,
    required this.onStartTraining,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization =AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: appTheme.gray5001,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      title: SizedBox(
        width: double.maxFinite,
        child: Text(
          localization.notification.toUpperCase(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.titleLargePrimaryContainer_1.copyWith(
            height: 1.27,
          ),
        ),
      ),
      content: Text(
        localization.timeToStartTraining,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: CustomTextStyles.bodySmallSecondaryContainer.copyWith(
          height: 1.33,
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
            onStartTraining();
          },
          child: Text(
            localization.start,
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
