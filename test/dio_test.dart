import 'package:dio/dio.dart';

final dio = Dio();

void main() async {
  await getHttp();
}

// main에 async await없으면 main이 안기다리고 종료되서 print 실행 안된다
// 그냥 void 반환이면 받을게 없어서 main에 await 못걸어주니까 Future<void> 반환
Future<void> getHttp() async {
  final response = await dio.get('https://dart.dev');
  print("1");
  print(response.data);
  print("2");
}
