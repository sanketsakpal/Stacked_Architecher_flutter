class ApiEndpoints {
  static String createSchedule =
      "https://showdigital.in/flutter-schedules/create_schedule.php";

  static String fetchSchedule =
      "https://showdigital.in/flutter-schedules/list_schedule.php";

  static String deleteSchedule({required String scheduleId}) {
    return "https://showdigital.in/flutter-schedules/delete_schedule.php?id=$scheduleId";
  }

  static String updateSchedule =
      "https://showdigital.in/flutter-schedules/update_schedule.php";
}
