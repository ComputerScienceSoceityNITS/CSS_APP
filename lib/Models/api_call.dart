import 'package:http/http.dart' as http;
import 'dart:convert';
import './memberModel.dart';

class Api {
  static Map<String, List<Member20>> members_20 = {
    "heads": [],
    "devWing": [],
    "cpWing": [],
    "executiveWing": [],
    "mlWing": [],
    "designWing": [],
    "literaryWing": [],
    "coHeads": [],
    "technical": []
  };
  static Map<String, List<Member21>> members_21 = {
    "heads": [],
    "devWing": [],
    "cpWing": [],
    "executiveWing": [],
    "mlWing": [],
    "designWing": [],
    "literaryWing": [],
    "coHeads": [],
    "technical": []
  };
  static Map<String, List<Member22>> members_22 = {
    "heads": [],
    "devWing": [],
    "cpWing": [],
    "executiveWing": [],
    "mlWing": [],
    "designWing": [],
    "literaryWing": [],
    "coHeads": [],
    "technical": []
  };

  static var year20 = [];
  static var year21 = [];
  static var year22 = [];

  static var url1 = "https://css-website.herokuapp.com/api/admin/members/19-20";
  static var url2 = "https://css-website.herokuapp.com/api/admin/members/20-21";
  static var url3 = "https://css-website.herokuapp.com/api/admin/members/21-22";

  static void getData1() async {
    try {
      final response = await http.get(Uri.parse(url1));
      final jsondata = jsonDecode(response.body);
      year20 = jsondata["members"] as List;
      for (var u in year20) {
        var check = u["role"].toString();
        Member20 member =
            Member20(u["avatar"]["url"], u["name"], u["role"], u["session"]);
        if (check == "General Secretary" ||
            check == "President" ||
            check == "Technical Head") {
          (members_20["heads"] as List).add(member);
        } else if (check.contains("Design")) {
          (members_20["designWing"] as List).add(member);
        } else if (check.contains("Executive")) {
          (members_20["executiveWing"] as List).add(member);
        } else if (check.contains("ML")) {
          (members_20["mlWing"] as List).add(member);
        } else if (check.contains("Dev")) {
          (members_20["devWing"] as List).add(member);
        } else if (check.contains("Literary")) {
          (members_20["literaryWing"] as List).add(member);
        } else if (check.contains("CP")) {
          (members_20["cpWing"] as List).add(member);
        } else {
          (members_20["technical"] as List).add(member);
        }
      }
    } catch (err) {}
  }

  static void getData2() async {
    try {
      final response = await http.get(Uri.parse(url2));
      final jsondata = jsonDecode(response.body);
      year21 = jsondata["members"] as List;
      for (var u in year21) {
        var check = u["role"].toString();

        Member21 member = Member21(
          u["avatar"]["url"],
          u["name"],
          u["role"],
          u["session"],
          u["socialMedia"]["facebook"],
          u["socialMedia"]["github"],
          u["socialMedia"]["linkedin"],
        );
        if (check == "General Secretary" ||
            check == "President" ||
            check == "Technical Head") {
          (members_21["heads"] as List).add(member);
        } else if (check.contains("Design")) {
          (members_21["designWing"] as List).add(member);
        } else if (check.contains("Executive")) {
          (members_21["executiveWing"] as List).add(member);
        } else if (check.contains("ML")) {
          (members_21["mlWing"] as List).add(member);
        } else if (check.contains("Dev")) {
          (members_21["devWing"] as List).add(member);
        } else if (check.contains("Literary")) {
          (members_21["literaryWing"] as List).add(member);
        } else if (check.contains("CP")) {
          (members_21["cpWing"] as List).add(member);
        } else {
          (members_21["heads"] as List).add(member);
        }
      }
    } catch (err) {}
  }

  static void getData3() async {
    try {
      final response = await http.get(Uri.parse(url3));
      final jsondata = jsonDecode(response.body);
      year22 = jsondata["members"] as List;
      for (var u in year22) {
        var check = u["role"].toString();
        Member22 member = Member22(
            u["avatar"]["url"],
            u["name"],
            u["role"],
            u["session"],
            u["socialMedia"]["facebook"],
            u["socialMedia"]["github"],
            u["socialMedia"]["linkedin"],
            u["socialMedia"]["instagram"]);
        if (check == "General Secretary" ||
            check == "President" ||
            check == "Technical Head") {
          (members_22["heads"] as List).add(member);
        } else if (check.contains("Secretary") ||
            check.contains("Head") ||
            check.contains("Senior") ||
            check.contains("Co-Head")) {
          (members_22["coHeads"] as List).add(member);
        } else if (check.contains("Design")) {
          (members_22["designWing"] as List).add(member);
        } else if (check.contains("Executive")) {
          (members_22["executiveWing"] as List).add(member);
        } else if (check.contains("ML")) {
          (members_22["mlWing"] as List).add(member);
        } else if (check.contains("Dev")) {
          (members_22["devWing"] as List).add(member);
        } else if (check.contains("Literary")) {
          (members_22["literaryWing"] as List).add(member);
        } else if (check.contains("CP")) {
          (members_22["cpWing"] as List).add(member);
        } else {
          (members_22["technical"] as List).add(member);
        }
      }
      for (Member22 check in members_22["coHeads"] as List) {
        if (check.role.toString().contains("Design")) {
          (members_22["designWing"] as List).insert(0, check);
        } else if (check.role.toString().contains("Executive")) {
          (members_22["executiveWing"] as List).insert(0, check);
        } else if (check.role.toString().contains("ML")) {
          (members_22["mlWing"] as List).insert(0, check);
        } else if (check.role.toString().contains("Dev")) {
          (members_22["devWing"] as List).insert(0, check);
        } else if (check.role.toString().contains("Literary")) {
          (members_22["literaryWing"] as List).insert(0, check);
        } else if (check.role.toString().contains("CP")) {
          (members_22["cpWing"] as List).insert(0, check);
        } else if (check.role.toString().contains("Secretary")) {
          (members_22["heads"] as List).add(check);
        }
      }
    } catch (err) {}
  }
}
