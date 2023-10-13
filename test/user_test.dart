import 'package:flutter_http_app/model/user.dart';

void main() {
  // 1. User Object 만들기
  User u1 = User(id: 1, username: "ssar", password: "1234", email: "ssar@nate.com");
  print(u1.username);

  // 2. User Map 만들기
  Map<String, dynamic> u2 = {
    "id": 2,
    "username": "cos",
    "password": "1234",
    "email": "cos@nate.com",
  };
  print(u2["username"]);

  // 3. Map을 Object로 변환 (받을때)
  User u3 = User.fromJson(u2);
  print(u3.username);

  // 4. Object를 Map으로 변환 (줄때)
  Map<String, dynamic> u4 = u3.toJson();
  print(u4["username"]);
}
