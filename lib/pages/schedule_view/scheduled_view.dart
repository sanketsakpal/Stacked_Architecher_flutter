import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_flutter/pages/schedule_view/scheduled_viewmodel.dart';
import 'package:stacked_architecture_flutter/resources/app_colors.dart';
import 'package:stacked_architecture_flutter/resources/app_styles.dart';
import 'package:stacked_architecture_flutter/utils/constant.dart';
import 'package:stacked_architecture_flutter/utils/validation_mixin.dart';
import 'package:stacked_architecture_flutter/widgets/build_custom_textform_field.dart';
import 'package:stacked_architecture_flutter/widgets/custom_drop_down.dart';
import 'package:stacked_architecture_flutter/widgets/custom_text_button.dart';

class ScheduledView extends StatelessWidget with ValidationsMixin {
  const ScheduledView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduledViewModel>.reactive(
      viewModelBuilder: () => ScheduledViewModel(),
      builder: (context, viewModel, _) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 36.h,
                  ),
                  Text(
                    "Create New Schedule",
                    style: getBoldTextStyle(fontSize: 24.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      children: [
                        BuildCustomDropDown<String>(
                          value: viewModel.selectedDate,
                          items: [
                            "2024-02-07",
                            "2024-03-07",
                            "2024-05-07",
                            "2024-06-07",
                          ].map<DropdownMenuItem<String>>((String names) {
                            return DropdownMenuItem<String>(
                              value: names,
                              child: Text(
                                names,
                                style: getRegularTextStyle(fontSize: 16.sp),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            viewModel.onDateChange(value);
                          },
                          labelText: "Select Date Range",
                          validator: validatedField,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        BuildCustomDropDown<String>(
                          value: viewModel.selectedTime,
                          items: ["3:00 PM", "4:00 PM", "5:30 PM"]
                              .map<DropdownMenuItem<String>>((String names) {
                            return DropdownMenuItem<String>(
                              value: names,
                              child: Text(
                                names,
                                style: getRegularTextStyle(fontSize: 16.sp),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            viewModel.onTimeChange(value);
                          },
                          labelText: "Select Time",
                          validator: validatedField,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        BuildCustomDropDown<String>(
                          value: viewModel.selectedSiteName,
                          items: ["Dr.Sharma", "Dr.shah", "Dr.kulkarni"]
                              .map<DropdownMenuItem<String>>((String names) {
                            return DropdownMenuItem<String>(
                              value: names,
                              child: Text(
                                names,
                                style: getRegularTextStyle(fontSize: 16.sp),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            viewModel.onSiteNameChange(value);
                          },
                          labelText: "Select Doctor Name",
                          validator: validatedField,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        BuildCustomTextFormField(
                          controller: viewModel.emailController,
                          scrollPadding:
                              kTextFieldDefaultScrollPadding(context),
                          labelText: "CC Email ID",
                          textInputType: TextInputType.emailAddress,
                          validator: validatedField,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Switch.adaptive(
                        value: viewModel.switchToggle,
                        onChanged: (value) {
                          viewModel.isOnlineMeeting(value);
                        },
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      Text(
                        "Schedule online meetings",
                        style: getRegularTextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BuildCustomTextButton(
                          buttonColor: AppColors.activeBlue,
                          borderRadius: 8.r,
                          textColor: AppColors.white,
                          onPressed: () {
                            viewModel.isUpdate
                                ? viewModel.updateScheduleData()
                                : viewModel.postData();

                            if (!viewModel.isBusy) {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('success'),
                                    content: const SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                              'New record created successfully'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Yes'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );

//
                            }
                          },
                          text: "Add Schedule",
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border(
                            bottom: BorderSide(
                                width: 1.5.w, color: AppColors.activeBlue),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Upcoming Schedule",
                            style: getRegularTextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      if (viewModel.separatedData == null)
                        Center(
                          child: Text(
                            "No upcoming Schedule",
                            style: getRegularTextStyle(fontSize: 16.sp),
                          ),
                        ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            viewModel.isBusy
                                ? const Center(
                                    widthFactor: 10,
                                    heightFactor: 5,
                                    child: CircularProgressIndicator())
                                : Row(
                                    children: List.generate(
                                      viewModel.separatedData?.length ?? 0,
                                      growable: true,
                                      (index) {
                                        final entries =
                                            viewModel.separatedData?[index];
                                        final date = entries?.first.date;
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              date ?? "",
                                              style: getRegularTextStyle(
                                                  fontSize: 16.sp),
                                            ),
                                            SizedBox(height: 16.h),
                                            SizedBox(
                                              height: 600,
                                              width: 400,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                  entries?.length ?? 0,
                                                  growable: true,
                                                  (index) {
                                                    final scheduleData =
                                                        entries?[index];
                                                    return Table(
                                                      columnWidths: const {
                                                        0: FlexColumnWidth(2),
                                                        1: FlexColumnWidth(0.5),
                                                        2: FlexColumnWidth(3),
                                                        3: FlexColumnWidth(0.1),
                                                        4: FlexColumnWidth(0.2),
                                                      },
                                                      children: [
                                                        TableRow(
                                                          children: [
                                                            Text(
                                                              scheduleData
                                                                      ?.time ??
                                                                  "3:00 PM",
                                                              style:
                                                                  getRegularTextStyle(
                                                                      fontSize:
                                                                          16.sp),
                                                            ),
                                                            SizedBox(
                                                                width: 10.h),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  scheduleData
                                                                          ?.docName ??
                                                                      "DR.sharma",
                                                                  style: getRegularTextStyle(
                                                                      fontSize:
                                                                          16.sp),
                                                                ),
                                                                Text(
                                                                  "(castro)",
                                                                  style: getRegularTextStyle(
                                                                      fontSize:
                                                                          16.sp),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                width: 10.h),
                                                            IconButton(
                                                              onPressed: () {
                                                                viewModel
                                                                    .setFieldData(
                                                                        index);
                                                              },
                                                              iconSize: 34.h,
                                                              icon: Icon(
                                                                MdiIcons
                                                                    .fileEdit,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: 10.h),
                                                            IconButton(
                                                              onPressed: () {
                                                                viewModel.deleteScheduleData(
                                                                    entries?[index]
                                                                            .id ??
                                                                        "");
                                                              },
                                                              icon: Icon(
                                                                  MdiIcons
                                                                      .delete),
                                                            ),
                                                            SizedBox(
                                                                width: 10.h),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
