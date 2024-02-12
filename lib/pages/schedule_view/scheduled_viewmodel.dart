import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_flutter/app/app.locator.dart';
import 'package:stacked_architecture_flutter/app/services/api_service.dart';
import 'package:stacked_architecture_flutter/models/get_schedule_data_model.dart';

class ScheduledViewModel extends FutureViewModel {
  final apiService = locator<ApiService>;

  final String _pageName = 'This is the scheduled Page';
  String get pageName => _pageName;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _selectedDate;
  String? get selectedDate => _selectedDate;

  String? _selectedSiteName;
  String? get selectedSiteName => _selectedSiteName;

  String? _selectedTime;
  String? get selectedTime => _selectedTime;

  TextEditingController emailController = TextEditingController();

  bool _switchToggle = false;
  bool get switchToggle => _switchToggle;
  List<GetScheduleDataModel>? scheduleModelData;

  List<List<GetScheduleDataModel>>? separatedData;
  Map<String, List<GetScheduleDataModel>>? groupedData;

  bool isUpdate = false;

  String id = "";

  Future<void> postData() async {
    final data = {
      "date": _selectedDate,
      "time": _selectedTime,
      "doc_name": _selectedSiteName,
      "online_meeting": _switchToggle == true ? "0" : "1",
      "email_cc": emailController.text.trim(),
    };

    final encodeData = jsonEncode(data);
    if (formKey.currentState!.validate()) {
      try {
        // Show loading indicator
        setBusy(true);

        // Call the API service method to post data
        await apiService().createSchedule(
          encodeData,
        );
        await apiService().getScheduleData();
        // Hide loading indicator
        setBusy(false);
      } catch (e) {
        // Handle errors
        if (kDebugMode) {
          print('Error: $e');
        }

        // Hide loading indicator
        setBusy(false);
      }
    }
    notifyListeners();
  }

  Future<void> getScheduleData() async {
    try {
      // Show loading indicator
      setBusy(true);

      // Call the API service method to post data
      scheduleModelData = await apiService().getScheduleData();

      groupedData = {};

      // Group data by date

      scheduleModelData?.forEach((entry) {
        if (!groupedData!.containsKey(entry.date)) {
          groupedData?[entry.date?.trim() ?? ""] = [];
        }
        groupedData![entry.date?.trim()]!.add(entry);
      });
      if (kDebugMode) {
        print(groupedData);
      }
      // Convert grouped data to a list
      separatedData = groupedData?.values.toList();

      // Hide loading indicator
      setBusy(false);
      rebuildUi();
    } catch (e) {
      // Handle errors
      if (kDebugMode) {
        print('Error: $e');
      }

      // Hide loading indicator
      setBusy(false);
    }
    rebuildUi();
  }

// delete schedule data

  Future<void> deleteScheduleData(String scheduleId) async {
    try {
      // Show loading indicator
      setBusy(true);

      // Call the API service method to post data
      await apiService().deleteSchedule(scheduleId);
      await apiService().getScheduleData();
      // Hide loading indicator
      setBusy(false);
    } catch (e) {
      // Handle errors
      if (kDebugMode) {
        print('Error: $e');
      }
      // Hide loading indicator
      setBusy(false);
    }
    notifyListeners();
  }
// update schedule

  Future<void> updateScheduleData() async {
    final data = {
      "id": id,
      "date": _selectedDate,
      "time": _selectedTime,
      "doc_name": _selectedSiteName,
      "online_meeting": _switchToggle == true ? "0" : "1",
      "email_cc": emailController.text.trim(),
    };

    final encodeData = jsonEncode(data);
    if (formKey.currentState!.validate()) {
      try {
        // Show loading indicator
        setBusy(true);
        // Call the API service method to post data
        await apiService().updateSchedule(
          encodeData,
        );
        await apiService().getScheduleData();
        // Hide loading indicator
        setBusy(false);
      } catch (e) {
        // Handle errors
        if (kDebugMode) {
          print('Error: $e');
        }

        // Hide loading indicator
        setBusy(false);
      }
    }
    rebuildUi();
  }

// set field data

  void setFieldData(int index) {
    emailController.text = scheduleModelData?[index].emailCc ?? "";
    _selectedDate = scheduleModelData?[index].date;
    _selectedSiteName = scheduleModelData?[index].docName;
    _selectedTime = scheduleModelData?[index].time;
    _switchToggle =
        scheduleModelData?[index].onlineMeeting == "0" ? false : true;
    id = scheduleModelData?[index].id ?? "";
    isUpdate = true;
    rebuildUi();
  }

  // To call every time when date selection changed and update the selected gender.
  ValueChanged<String?>? onDateChange(String? date) {
    _selectedDate = date;
    if (kDebugMode) {
      print(_selectedDate);
    }
    return null;
  }

  ValueChanged<String?>? onSiteNameChange(String? name) {
    _selectedSiteName = name;
    if (kDebugMode) {
      print(_selectedSiteName);
    }
    return null;
  }

  ValueChanged<String?>? onTimeChange(String? time) {
    _selectedTime = time;
    if (kDebugMode) {
      print(_selectedTime);
    }
    return null;
  }

  void Function(bool)? isOnlineMeeting(bool isOnline) {
    _switchToggle = isOnline;
    rebuildUi();
    if (kDebugMode) {
      print(_switchToggle);
    }
    return null;
  }

  @override
  Future futureToRun() => getScheduleData();
}
