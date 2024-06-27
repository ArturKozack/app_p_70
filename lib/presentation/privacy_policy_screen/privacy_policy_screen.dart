import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key})
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
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [_buildMainContentColumn(context), SizedBox(height: 4.v)],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 20.v,
          bottom: 20.v,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Privacy Policy".toUpperCase(),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildDescriptionTextBlock(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.layersPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Lorem ipsum dolor sit amet consectetur.\nSit arcu nulla cursus enim consectetur sit rutrum. Id tincidunt tincidunt tortor vulputate pretium viverra. Turpis mi commodo pellentesque interdum consectetur sollicitudin sed at vel. Odio ullamcorper aliquam urna magna lacus in magna felis odio.  Lorem ipsum dolor sit amet consectetur.\nSit arcu nulla cursus enim consectetur sit rutrum. Id tincidunt tincidunt tortor vulputate pretium viverra. Turpis mi commodo pellentesque interdum consectetur sollicitudin sed at vel. Odio ullamcorper aliquam urna magna lacus in magna felis odio.",
            maxLines: 21,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyLarge!.copyWith(
              height: 1.25,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMainContentColumn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [_buildDescriptionTextBlock(context)],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
