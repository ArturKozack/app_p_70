import 'package:app_p_70/core/app_export.dart';
import 'package:app_p_70/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function() onTap;

  const AppButton({
    super.key,
    this.title = 'Next',
    this.isActive = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 50.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgUnion,
              height: 50.v,
              width: double.maxFinite,
              color: theme.colorScheme.primary.withOpacity(isActive ? 1 : 0.7),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: title.length == 4
                          ? 128.h
                          : (128 - title.length * 2.5).h,
                    ),
                    child: Center(
                      child: Text(
                        title,
                        style: CustomTextStyles.bodyLargeGray50,
                      ),
                    ),
                  ),
                  CustomIconButton(
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    padding: EdgeInsets.all(8.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgNorthEast,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
