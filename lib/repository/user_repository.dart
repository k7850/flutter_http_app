import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio(
  BaseOptions(baseUrl: "http://192.168.0.45:8080"),
);

class UserRepository {
  Future<List<User>> fetchUserList() async {
    Response<dynamic> response = await dio.get("/user");
    // print(response.data);

    List<dynamic> bodyList = response.data as List<dynamic>;

    List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();

    return userList;
  }

  Future<User> fetchUser(int id) async {
    Response<dynamic> response = await dio.get("/user/$id");
    // print(response.data);

    Map<String, dynamic> body = response.data as Map<String, dynamic>;

    User user = User.fromJson(body);

    return user;
  }
}
