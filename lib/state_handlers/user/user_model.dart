class UserModel {
  String name;
  String email;
  String scholarID;
  String? codeforcesHandle;
  String? githubHandle;
  List<String> registeredAbacusEvents;
  List<String> registeredEnigmas;

  UserModel({
    required this.name,
    required this.email,
    required this.scholarID,
    this.codeforcesHandle,
    this.githubHandle,
    this.registeredAbacusEvents = const [],
    this.registeredEnigmas = const [],
  });

  static UserModel read(dynamic data) {
    data = data['user'];
    return UserModel(
        name: data['name'],
        email: data['email'],
        scholarID: data['scholarID'],
        codeforcesHandle: data['codeforcesHandle'],
        githubHandle: data['githubHandle'],
        registeredAbacusEvents:
            List<String>.from(data['registeredAbacusEvents']),
        registeredEnigmas: List<String>.from(data['registeredEnigmas']));
  }
}
