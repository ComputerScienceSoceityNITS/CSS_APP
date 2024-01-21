import 'dart:convert';

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

  // Convert UserModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'scholarID': scholarID,
      'codeforcesHandle': codeforcesHandle,
      'githubHandle': githubHandle,
      'registeredAbacusEvents': registeredAbacusEvents,
      'registeredEnigmas': registeredEnigmas,
    };
  }

  // Create a UserModel from a Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      scholarID: map['scholarID'],
      codeforcesHandle: map['codeforcesHandle'],
      githubHandle: map['githubHandle'],
      registeredAbacusEvents: List<String>.from(map['registeredAbacusEvents']),
      registeredEnigmas: List<String>.from(map['registeredEnigmas']),
    );
  }

  // Convert UserModel to a JSON string
  String toJson() => json.encode(toMap());

  // Create a UserModel from a JSON string
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
