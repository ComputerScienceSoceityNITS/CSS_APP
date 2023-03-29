class EnigmaEventModel {
  final String id;
  final String cfContestLink;
  final String startDate;
  final String startTime;
  final int durationInHrs;

  EnigmaEventModel({
    required this.id,
    required this.cfContestLink,
    required this.durationInHrs,
    required this.startDate,
    required this.startTime,
  });
}
