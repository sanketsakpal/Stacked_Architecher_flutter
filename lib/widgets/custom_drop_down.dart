import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_architecture_flutter/resources/app_colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked_architecture_flutter/resources/app_styles.dart';

/// Create a Custom [DropdownButtonFormField] widget where [T] is type means we can pass any value
/// for example int,string, double, bool,list and any custom model class.
class BuildCustomDropDown<T> extends StatelessWidget {
  const BuildCustomDropDown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.labelText,
    this.validator,
  });

  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final String labelText;
  final FormFieldValidator<T>? validator;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        // alignedDropdown: true,
        child: DropdownButtonFormField<T>(
          icon: Icon(MdiIcons.chevronDown),
          hint: Text(
            'Select',
            style: getRegularTextStyle(
              fontSize: width > 600 ? 12.sp : 16.sp,
              color: AppColors.grey,
            ),
          ),
          style: TextStyle(fontSize: 18.sp),
          isExpanded: true,
          value: value,
          elevation: 16,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: labelTextStyle.copyWith(fontSize: 14.sp),
            errorStyle: errorTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            contentPadding: EdgeInsets.all(14.w),
          ),
          onChanged: onChanged,
          validator: validator,
          items: items,
        ),
      ),
    );
  }
}
