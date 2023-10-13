import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 퓨처빌더를 써야 통신이 끝났을때 snapshot 뿌리기 가능
      // 리턴타입을 제네릭으로 <List<User>>
      body: FutureBuilder<List<User>>(
        future: UserRepository().fetchUserList(),
        // snapshot에 future의 결과값이 담김
        builder: (context, snapshot) {
          print("그림 그려짐");
          if (snapshot.hasData) {
            List<User> userList = snapshot.data ?? [];
            // 통신 끝남
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${userList[index].id}"),
                  title: Text("${userList[index].username}"),
                  subtitle: Text("${userList[index].email}"),
                );
              },
            );
          } else {
            // 통신 도중인 상태
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UserRepository().fetchUser(1),
        builder: (context, snapshot) {
          print("그림 그려짐");
          if (snapshot.hasData) {
            User user = snapshot.data ?? new User();
            // 통신 끝남
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${user.id}"),
                  title: Text("${user.username}"),
                  subtitle: Text("${user.email}"),
                );
              },
            );
          } else {
            // 통신 도중인 상태
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
