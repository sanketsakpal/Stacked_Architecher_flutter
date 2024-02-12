import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsets kTextFieldDefaultScrollPadding(BuildContext context) {
  return EdgeInsets.only(
    bottom: MediaQuery.of(context).viewInsets.bottom + 36.h,
  );
}
