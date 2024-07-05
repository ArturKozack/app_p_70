import 'package:app_p_70/core/models/day_type/day_type.dart';
import 'package:app_p_70/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:app_p_70/core/app_export.dart';

class DayTypeWidget extends StatelessWidget {
  final DayType dayType;
  final bool isSelected;
  final Function() onSelected;

  const DayTypeWidget({
    Key? key,
    required this.dayType,
    this.isSelected = false,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 12.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          dayType.title.capitalized,
          style: TextStyle(
            color: isSelected
                ? appTheme.whiteA700
                : theme.colorScheme.onPrimary.withOpacity(1),
            fontSize: 12.fSize,
            fontFamily: 'Kharkiv Tone',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: isSelected,
        backgroundColor: appTheme.gray5001,
        selectedColor: theme.colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected
                ? theme.colorScheme.onPrimaryContainer
                : appTheme.gray5001,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(
            16.h,
          ),
        ),
        onSelected: (value) => onSelected(),
      ),
    );
  }
}
