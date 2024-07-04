import 'package:app_p_70/core/utils/settings_utils.dart';
import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart';
import 'package:app_p_70/widgets/custom_icon_button.dart'; // ignore: must_be_immutable

class SettingsItemWidget extends StatelessWidget {
  final SettingsItemType settingsItem;

  const SettingsItemWidget({
    Key? key,
    required this.settingsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => settingsItem.onTap(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 18.v,
        ),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.v),
              child: Text(
                settingsItem.title,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            CustomIconButton(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(8.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(),
              child: CustomImageView(
                imagePath: ImageConstant.imgNorthEastPrimarycontainer,
              ),
            )
          ],
        ),
      ),
    );
  }
}
