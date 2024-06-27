import 'package:app_p_70/presentation/home_screen/widgets/traininglist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key})
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
            children: [
              _buildInstructionSection(context),
              SizedBox(height: 4.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "Home".toUpperCase(),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgBasicSettings,
          margin: EdgeInsets.only(
            top: 17.v,
            right: 14.h,
            bottom: 17.v,
          ),
        )
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildTrainingSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgGroup12,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 14.v),
          CustomElevatedButton(
            text: "Training credit",
            margin: EdgeInsets.symmetric(horizontal: 14.h),
          ),
          SizedBox(height: 48.v),
          Text(
            "00:00:00",
            style: theme.textTheme.displayLarge,
          ),
          SizedBox(height: 48.v),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Balance 0",
                  style: theme.textTheme.headlineSmall,
                ),
                CustomIconButton(
                  height: 74.adaptSize,
                  width: 74.adaptSize,
                  padding: EdgeInsets.all(16.h),
                  decoration: IconButtonStyleHelper.fillOnError,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgPlayCircle,
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
  Widget _buildInstructionSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          _buildTrainingSection(context),
          SizedBox(height: 44.v),

          _buildTrainingList(context),
          // _noData()
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTrainingList(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10.v,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return TraininglistItemWidget();
        },
      ),
    );
  }

  SizedBox _noData() {
    return SizedBox(
      width: double.maxFinite,
      child: Text(
        "Choose the days for training in the settings and start recording the time",
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: CustomTextStyles.bodyLarge18.copyWith(
          height: 1.56,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 40.v,
      margin: EdgeInsets.only(left: 16.h),
      child: TabBar(
        //TODO
        // controller: tabviewController,
        isScrollable: true,
        labelColor: appTheme.gray50,
        labelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Kharkiv Tone',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: theme.colorScheme.onPrimary.withOpacity(1),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Kharkiv Tone',
          fontWeight: FontWeight.w400,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(
            16.h,
          ),
          boxShadow: [
            BoxShadow(
              color: appTheme.black90026,
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(
                0,
                0,
              ),
            )
          ],
        ),
        dividerHeight: 0.0,
        tabs: [
          Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 12.v,
              ),
              child: Text(
                "All",
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 12.v,
              ),
              child: Text(
                "Monday",
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 12.v,
              ),
              child: Text(
                "Wednesday",
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 12.v,
              ),
              child: Text(
                "Friday",
              ),
            ),
          )
        ],
      ),
    );
  }
}
