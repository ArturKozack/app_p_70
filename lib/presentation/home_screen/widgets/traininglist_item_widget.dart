import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class TraininglistItemWidget extends StatelessWidget {
  const TraininglistItemWidget({Key? key})
      : super(
          key: key,
        );

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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1h",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    "Monday",
                    style: CustomTextStyles.bodySmallSecondaryContainer,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.v),
            child: Text(
              "+60",
              style: CustomTextStyles.bodyLargeLightgreen400,
            ),
          )
        ],
      ),
    );
  }
}
