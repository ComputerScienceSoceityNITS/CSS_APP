import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/memberModel.dart';
import '../utils/network_engine.dart';

class AbacusRegistrationProvider with ChangeNotifier {
  var apiUrl = "https://css-cms.onrender.com/api/admin/abacus/register/";

  Future<Response> register({
    required String eventId,
    required String teamName,
    required String teamLeaderScholarID,
    required List<MemberModel> members,
  }) async {
    final dio = await NetworkEngine.getDio();
    List memberScholarIDs = members.map((e) => e.scholarId).toList();
    Map parameters = {
      "teamName": teamName,
      "teamLeaderScholarID": teamLeaderScholarID,
      "memberScholarIDs": memberScholarIDs,
    };

    var jsonData = await jsonEncode(parameters);

    print(jsonData);
    print('${apiUrl}${eventId}');
    var res = await (await NetworkEngine.getDio()).post(
      '${apiUrl}${eventId}',
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      ),
      data: jsonData,
    );
    print(res);
    return res;
  }
}
