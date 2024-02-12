import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as https;
import 'package:stacked_architecture_flutter/models/get_schedule_data_model.dart';
import 'package:stacked_architecture_flutter/utils/api_end_points.dart';

class ApiService {
  // create new schedule

  Future<void> createSchedule(
    data,
  ) async {
    final url = Uri.parse(ApiEndpoints.createSchedule);
    final response = await https.post(url,
        headers: {
          'Content-Type': 'application/json',
          "Accept": 'application/json',
        },
        body: data);
    final res = jsonEncode(jsonDecode(response.body));
    if (response.statusCode == 200) {
      getScheduleData();
      if (kDebugMode) {
        print(res);
      }
    }
  }

  // fetch created schedule

  Future<List<GetScheduleDataModel>?> getScheduleData() async {
    final url = Uri.parse(ApiEndpoints.fetchSchedule);
    try {
      final response = await https.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final jsonResponse = jsonDecode(response.body);

        // Convert each item in the list to a GetScheduleDataModel instance
        if (jsonResponse is List) {
          final List<GetScheduleDataModel> scheduleList = jsonResponse
              .map((data) => GetScheduleDataModel.fromJson(data))
              .toList();
          if (kDebugMode) {
            print(scheduleList);
          }
          // Return the parsed data
          return scheduleList;
        } else if (jsonResponse is Map<String, dynamic>) {
          // Handle case where responseData is a single object
          // Convert the single object into a list with one element
          return [GetScheduleDataModel.fromJson(jsonResponse)];
        } else {
          // Handle unexpected data structure
          throw Exception(
              "Invalid response format: Expected a list or a single object");
        }
      } else {
        // If the server response was not OK, throw an error or handle it accordingly
        throw Exception('Failed to load schedule data: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any exceptions that occur during the HTTP request
      if (kDebugMode) {
        print('Error fetching schedule data: $e');
      }

      // Return null to indicate failure
      return null;
    }
  }

  // delete schedule

  Future<void> deleteSchedule(String scheduleId) async {
    final url = Uri.parse(ApiEndpoints.deleteSchedule(scheduleId: scheduleId));
    try {
      final response = await https.get(url);
      if (response.statusCode == 200) {
        final res = jsonEncode(jsonDecode(response.body));
        getScheduleData();
        if (kDebugMode) {
          print(res);
        }
      } else {
        // If the server response was not OK, throw an error or handle it accordingly
        throw Exception('Failed to load schedule data: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any exceptions that occur during the HTTP request
      if (kDebugMode) {
        print('Error fetching schedule data: $e');
      }
    }
  }

  // update schedule data

  Future<void> updateSchedule(
    data,
  ) async {
    final url = Uri.parse(ApiEndpoints.updateSchedule);
    final response = await https.put(url,
        headers: {
          'Content-Type': 'application/json',
          "Accept": 'application/json',
        },
        body: data);
    final res = jsonEncode(jsonDecode(response.body));
    if (response.statusCode == 200) {
      getScheduleData();
      if (kDebugMode) {
        print(res);
      }
    }
  }
}
