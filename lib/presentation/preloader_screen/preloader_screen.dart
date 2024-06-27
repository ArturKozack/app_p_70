import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class PreloaderScreen extends StatelessWidget {
  const PreloaderScreen({Key? key})
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
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 42.v,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Spacer(), _buildMainColumn(context)],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMainColumn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            width: 150.h,
            child: Column(
              children: [
                Container(
                  height: 150.v,
                  width: 150.h,
                  decoration: AppDecoration.accentPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "M",
                              style:
                                  CustomTextStyles.architectsDaughterWhiteA700,
                            ),
                            TextSpan(
                              text: "M",
                              style: CustomTextStyles.architectsDaughterGray800,
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 202.v),
                CustomImageView(
                  imagePath: ImageConstant.imgAnimation500Lcj5swli,
                  height: 128.adaptSize,
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 10.h),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
