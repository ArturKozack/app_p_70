import 'package:app_p_70/presentation/widgets/app_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart';
import 'package:app_p_70/widgets/app_bar/appbar_subtitle.dart';
import 'package:app_p_70/widgets/app_bar/custom_app_bar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

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
          child: _buildBody(context),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 90.v,
      actions: [
        AppbarSubtitle(
          text: AppLocalizations.of(context)!.skip,
          margin: EdgeInsets.only(
            top: 18.v,
            right: 36.h,
            bottom: 19.v,
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            localizations.trainingCredit,
            style: theme.textTheme.displaySmall,
          ),
          SizedBox(height: 22.v),
          SizedBox(
            width: double.maxFinite,
            child: Text(
              localizations.remindersAndRecording,
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
          AppButton(
            title: localizations.next,
            onTap: () =>
                Navigator.pushNamed(context, AppRoutes.onboardingTimerScreen),
          ),
        ],
      ),
    );
  }
}
