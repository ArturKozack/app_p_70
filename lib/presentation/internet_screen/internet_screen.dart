import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimaryContainer,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgPreloader,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildConnectionErrorMessage(context),
                SizedBox(height: 4.v)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildConnectionErrorMessage(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 36.h,
              vertical: 28.v,
            ),
            decoration: AppDecoration.backgroundBackground1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Looks like you lost internet connection."
                            .toUpperCase(),
                        style: CustomTextStyles.titleLargePrimaryContainer,
                      ),
                      TextSpan(
                        text: " \n".toUpperCase(),
                        style:
                            CustomTextStyles.titleLargeRobotoPrimaryContainer,
                      ),
                      TextSpan(
                        text: "Try again later",
                        style: CustomTextStyles.bodyLargeOnPrimaryContainer,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
