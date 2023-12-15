class CoverPic {
  final String publicId;
  final String url;

  CoverPic({
    required this.publicId,
    required this.url,
  });
}

class EventModel {
  final CoverPic coverPic;
  final String id;
  final String name;
  final String description;
  final String startDate;
  final String endDate;
  final String startTime;
  final String groupLink;
  final String eventType;
  final int minTeamSize;
  final int maxTeamSize;

  EventModel({
    required this.coverPic,
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.eventType,
    required this.groupLink,
    required this.minTeamSize,
    required this.maxTeamSize,
  });
}
