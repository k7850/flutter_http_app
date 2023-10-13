// import 'package:dio/dio.dart';
// import 'package:flutter_http_app/model/user.dart';
//
// import 'dio_test.dart';
//
// void main() async {
//   await fetchUser_test(1);
// }
//
// Future<User> fetchUser_test(int id) async {
//   Response<dynamic> response = await dio.get("http://192.168.0.45:8080/user/$id");
//   // 타입 적기 힘드니까 그냥
//   // 로컬호스트 X
//   // Map이 아니라 Map 여러개 리스트를 받을 수도 있으니까 그냥 dynamic으로 받아서 변환한다
//   print("response : ${response}"); // Json
//   print("response.data : ${response.data}"); // data 붙히면 dio 라이브러리가 Map으로 바꿔줌
//
//   Map<String, dynamic> body = response.data as Map<String, dynamic>; // 자바랑 문법 다르다.
//   print(body["username"]);
//   User user = User.fromJson(body);
//   return user;
// }

import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio();

void main() async {
  await fetchUserList_test();
}

Future<List<User>> fetchUserList_test() async {
  Response<dynamic> response = await dio.get("http://192.168.0.45:8080/user");
  print(response.data);

  List<dynamic> bodyList = response.data as List<dynamic>;
  List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();

  return userList;
}

Future<User> fetchUser_test(int id) async {
  Response<dynamic> response = await dio.get("http://192.168.0.45:8080/user/$id");
  print(response.data);

  Map<String, dynamic> body = response.data as Map<String, dynamic>;
  print(body["username"]);

  User user = User.fromJson(body);
  return user;
}
