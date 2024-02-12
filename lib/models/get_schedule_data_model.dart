// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetScheduleDataModel {
  String? id;
  String? date;
  String? time;
  String? docName;
  String? onlineMeeting;
  String? emailCc;

  GetScheduleDataModel(
      {this.id,
      this.date,
      this.time,
      this.docName,
      this.onlineMeeting,
      this.emailCc});

  GetScheduleDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] as String?;
    date = json["date"] as String?;
    time = json["time"] as String?;
    docName = json["doc_name"] as String?;
    onlineMeeting = json["online_meeting"] as String?;
    emailCc = json["email_cc"] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["date"] = date;
    _data["time"] = time;
    _data["doc_name"] = docName;
    _data["online_meeting"] = onlineMeeting;
    _data["email_cc"] = emailCc;
    return _data;
  }

  GetScheduleDataModel copyWith({
    String? id,
    String? date,
    String? time,
    String? docName,
    String? onlineMeeting,
    String? emailCc,
  }) =>
      GetScheduleDataModel(
        id: id ?? this.id,
        date: date ?? this.date,
        time: time ?? this.time,
        docName: docName ?? this.docName,
        onlineMeeting: onlineMeeting ?? this.onlineMeeting,
        emailCc: emailCc ?? this.emailCc,
      );

  @override
  String toString() {
    return 'GetScheduleDataModel(id: $id, date: $date, time: $time, docName: $docName, onlineMeeting: $onlineMeeting, emailCc: $emailCc)';
  }
}
