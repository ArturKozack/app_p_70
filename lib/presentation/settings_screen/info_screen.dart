import 'package:app_p_70/core/utils/settings_utils.dart';
import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart';
import 'package:app_p_70/widgets/app_bar/appbar_leading_image.dart';
import 'package:app_p_70/widgets/app_bar/appbar_title.dart';
import 'package:app_p_70/widgets/app_bar/custom_app_bar.dart';

class InfoScreen extends StatelessWidget {
  final SettingsItemType type;

  const InfoScreen(
    this.type, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        appBar: _buildAppBar(context),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 20.v,
          ),
          child: _buildBody(context),
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
        text: type.title.toUpperCase(),
      ),
      styleType: Style.bgFill,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.layersPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 8.v,
        ),
        child: Text(
          type.description,
          maxLines: 21,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyLarge!.copyWith(
            height: 1.25,
          ),
        ),
      ),
    );
  }
}
