import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 24.v,
          ),
          child: Column(
            children: [_buildTitleSection(context), SizedBox(height: 4.v)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 90.v,
      actions: [
        AppbarSubtitle(
          text: "Skip",
          margin: EdgeInsets.only(
            top: 18.v,
            right: 36.h,
            bottom: 19.v,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildOnboardingCard(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            "Training credit",
            style: theme.textTheme.displaySmall,
          ),
          SizedBox(height: 22.v),
          SizedBox(
            width: double.maxFinite,
            child: Text(
              "Reminders and recording of training in your smartphone",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.headlineSmallPrimaryContainer.copyWith(
                height: 1.06,
              ),
            ),
          ),
          SizedBox(height: 22.v),
          CustomImageView(
            imagePath: ImageConstant.imgImage,
            height: 398.v,
            width: double.maxFinite,
          ),
          SizedBox(height: 22.v),
          SizedBox(
            height: 50.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgUnion,
                  height: 50.v,
                  width: double.maxFinite,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 124.h,
                          top: 8.v,
                        ),
                        child: Text(
                          "Next",
                          style: CustomTextStyles.bodyLargeGray50,
                        ),
                      ),
                      CustomIconButton(
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        padding: EdgeInsets.all(8.h),
                        alignment: Alignment.center,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgNorthEast,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTitleSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [_buildOnboardingCard(context)],
      ),
    );
  }
}
