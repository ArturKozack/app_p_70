import 'package:app_p_70/core/models/training/training.dart';
import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart'; // ignore: must_be_immutable

class TrainingItemWidget extends StatelessWidget {
  final TrainingModel training;

  const TrainingItemWidget({
    Key? key,
    required this.training,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.layersPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  training.formattedDuration,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 8.v),
                Text(
                  training.formattedDate,
                  style: CustomTextStyles.bodySmallSecondaryContainer,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.v),
            child: Text(
              training.points.toString(),
              style: CustomTextStyles.bodyLargeLightgreen400,
            ),
          )
        ],
      ),
    );
  }
}
