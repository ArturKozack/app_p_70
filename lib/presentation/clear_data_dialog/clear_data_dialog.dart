import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class ClearDataDialog extends StatelessWidget {
  const ClearDataDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
          child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(24.h),
              decoration: AppDecoration.backgroundBackground1.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      "Delete all app cache?".toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargePrimaryContainer_1
                          .copyWith(
                        height: 1.27,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.v),
                  Text(
                    "All your data will be lost,\nbeyond recovery",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        CustomTextStyles.bodySmallSecondaryContainer.copyWith(
                      height: 1.33,
                    ),
                  ),
                  SizedBox(height: 34.v),
                  SizedBox(
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Cancel",
                              style: theme.textTheme.bodyLarge,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 32.h),
                              child: Text(
                                "Delete",
                                style: theme.textTheme.bodyLarge,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.v)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
