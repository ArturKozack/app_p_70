import 'package:app_p_70/core/repositories.dart/main_repository.dart';
import 'package:app_p_70/core/utils/settings_utils.dart';
import 'package:app_p_70/presentation/settings_screen/widgets/settings_item_widget.dart';
import 'package:app_p_70/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart';
import 'package:app_p_70/widgets/app_bar/appbar_leading_image.dart';
import 'package:app_p_70/widgets/app_bar/appbar_title.dart';
import 'package:app_p_70/widgets/app_bar/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
            children: [
              _buildSettingsItemList(context),
              SizedBox(height: 24.v),
              if (!MainRepository.isTimerActive)
                AppButton(
                  title: 'Select Days',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.onboardingScreen),
                ),
            ],
          ),
        ),
      ),
    );
  }

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
        onTap: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Settings".toUpperCase(),
      ),
      styleType: Style.bgFill,
    );
  }

  Widget _buildSettingsItemList(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 12.v,
          );
        },
        itemCount: SettingsItemType.values.length,
        itemBuilder: (context, index) {
          return SettingsItemWidget(
            settingsItem: SettingsItemType.values[index],
          );
        },
      ),
    );
  }
}
