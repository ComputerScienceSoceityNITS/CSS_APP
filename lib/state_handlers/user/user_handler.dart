import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'user_model.dart';
import 'package:cssapp/utils/network_engine.dart';
import 'package:cssapp/utils/storage_handler.dart';

class UserHandler extends ChangeNotifier {
  UserModel? user;
  UserHandler();

  Future<Response> createUser({
    required String name,
    required String password,
    required String email,
    required String scholarID,
    String? codeforcesHandle,
    String? githubHandle,
  }) async {
    Map data = {
      'name': name,
      'password': password,
      'email': email,
      'scholarID': scholarID,
    };
    if (codeforcesHandle?.isNotEmpty ?? false) {
      data['codeforcesHandle'] = codeforcesHandle;
    }
    if (githubHandle?.isNotEmpty ?? false) {
      data['githubHandle'] = githubHandle;
    }
    user = UserModel(
      name: name,
      email: email,
      scholarID: scholarID,
      codeforcesHandle: codeforcesHandle,
      githubHandle: githubHandle,
    );
    return await (await NetworkEngine.getDio()).post(
      NetworkEngine.registerUser,
      data: json.encode(data),
    );
  }

  Future<Response> login(
      {required String password, required String email}) async {
    Response res = await (await NetworkEngine.getDio()).post(
      NetworkEngine.loginUser,
      data: json.encode({
        'password': password,
        'email': email,
      }),
    );

    if ((res.statusCode ?? 400) >= 200 && (res.statusCode ?? 400) < 300) {
      user = UserModel.read(res.data);
      // Storing user details in local storage on successful login
      StorageHandler().saveUserToLocalStorage(user!);
    }
    return res;
  }

  Future<Response> fetchUser() async {
    Response res =
        await (await NetworkEngine.getDio()).get(NetworkEngine.fetchUser);

    if ((res.statusCode ?? 400) >= 200 &&
        (res.statusCode ?? 400) < 300 &&
        res.data?['user'] != null) {
      user = UserModel.read(res.data);
    } else {
      // Loading user from local storage
      user = await StorageHandler().loadUserFromLocalStorage();
    }
    return res;
  }

  Future<Response> registerEnigma(String id) async {
    Response response = await (await NetworkEngine.getDio()).post(
      NetworkEngine.registerEnigma(id),
    );
    if ((response.statusCode ?? 400) >= 200 &&
        (response.statusCode ?? 400) < 300) {
      user!.registeredAbacusEvents.add(id);
      notifyListeners();
    }
    return response;
  }
}
