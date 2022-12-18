import 'member_api.dart';

class Member {
  final String imageLink;
  final String name;
  final String role;
  final Session session;
  final String? fb;
  final String? insta;
  final String? git;
  final String? linkedin;

  const Member(
      {required this.imageLink,
      required this.name,
      required this.role,
      required this.session,
      this.fb,
      this.insta,
      this.git,
      this.linkedin});

  String roleToString() => mapRole[role]!;
  String sessionToString() => mapSession[session]!;
}
