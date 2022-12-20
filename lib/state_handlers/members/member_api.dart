import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'member.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

enum Role {
  head,
  devWing,
  cpWing,
  executiveWing,
  mlWing,
  designWing,
  literaryWing,
  coHead,
  technical,
}

enum Session { session_19_20, session_20_21, session_21_22 }

Map<Role, String> mapRole = {
  Role.head: "Heads",
  Role.devWing: "Dev Wing",
  Role.cpWing: "CP Wing",
  Role.executiveWing: "Executive Wing",
  Role.mlWing: "ML Wing",
  Role.designWing: "Design Wing",
  Role.literaryWing: "Literary Wing",
  Role.coHead: "Co-Head",
  Role.technical: "Technical"
};

Map<Session, String> mapSession = {
  Session.session_19_20: "19-20",
  Session.session_20_21: "20-21",
  Session.session_21_22: "21-22"
};
Map<String, Session> reverseMapSession = {
  "19-20": Session.session_19_20,
  "20-21": Session.session_20_21,
  "21-22": Session.session_21_22,
};

class MemberApi extends ChangeNotifier {
  final String apiLink =
      "https://tasty-crab-hosiery.cyclic.app/api/admin/members/";

  Map<Session, Map<Role, List<Member>>> members =
      {}; // First map maps to the session and the inner map maps to the role

  Future<String?> getAllData() async {
    for (Session session in Session.values) {
      String? err = await getData(session);
      if (err != null) return err;
    }
    return null;
  }

  Future<String?> getData(Session session) async {
    try {
      final response =
          await http.get(Uri.parse(apiLink + mapSession[session]!));
      final List data = (await jsonDecode(response.body))["members"];
      members[session] = {};
      for (Role role in Role.values) {
        members[session]![role] = [];
      }

      String imageLink;
      String name;
      Role? role;
      Role role2;
      String? facebook;
      String? github;
      String? insta;
      String? linkedin;
      for (var memberDetails in data) {
        imageLink = memberDetails["avatar"]["url"];
        CachedNetworkImage(imageUrl: imageLink);
        name = memberDetails["name"];
        if (memberDetails["socialMedia"] != null) {
          facebook = memberDetails["socialMedia"]["facebook"];
          github = memberDetails["socialMedia"]["github"];
          insta = memberDetails["socialMedia"]["instagram"];
          linkedin = memberDetails["socialMedia"]["linkedin"];
        }
        String r = (memberDetails["role"] as String).trim();
        if (r.toLowerCase().contains("general secretary") ||
            r.toLowerCase().contains("president") ||
            r.toLowerCase().contains("technical head")) {
          role = Role.head;
          if (r.toLowerCase().contains("assistant") ||
              r.toLowerCase().contains("associate")) {
            role2 = Role.head;
          }
        } else if (r.toLowerCase().contains("head") ||
            r.toLowerCase().contains("senior")) {
          role = Role.coHead;
        }
        if (r.toLowerCase().contains("design")) {
          role2 = Role.designWing;
        } else if (r.toLowerCase().contains("executive")) {
          role2 = Role.executiveWing;
        } else if (r.toLowerCase().contains("ml")) {
          role2 = Role.mlWing;
        } else if (r.toLowerCase().contains("dev")) {
          role2 = Role.devWing;
        } else if (r.toLowerCase().contains("literary")) {
          role2 = Role.literaryWing;
        } else if (r.toLowerCase().contains("cp")) {
          role2 = Role.cpWing;
        } else {
          role2 = Role.technical;
        }

        Member member = Member(
            imageLink: imageLink,
            name: name,
            role: (memberDetails["role"] as String).trim(),
            session: session,
            fb: facebook,
            git: github,
            insta: insta,
            linkedin: linkedin);

        if (role != null) {
          if (role != Role.head) {
            members[session]![role2]!.insert(0, member);
          } else {
            members[session]![role]!.add(member);
          }
        } else {
          members[session]![role2]!.add(member);
        }
        role = null;
      }
      List<Member> memberList;
      memberList = members[session]![Role.head]!
          .where((member) => member.role.toLowerCase() == "general secretary")
          .toList();
      members[session]![Role.head]!.remove(memberList[0]);
      members[session]![Role.head]!.insert(0, memberList[0]);
      memberList = members[session]![Role.head]!
          .where((member) =>
              member.role.toLowerCase().contains("associate") ||
              member.role.toLowerCase().contains("assistant"))
          .toList();
      for (Member member in memberList) {
        members[session]![Role.head]!.remove(member);
        members[session]![Role.head]!.add(member);
      }

      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
