import 'package:dio/dio.dart';
import 'package:http_requests/model/user.dart';

class HttpService {
  HttpService._();
  factory HttpService() => HttpService._(); // Singleton
  Future<List<User>> getUsers() async {
    Dio dio = Dio(); // parmeter less constructor
    var response = await dio.get('https://reqres.in/api/users?page=2');
    List<dynamic> users = response.data['data'];
    return users.map((user) => User.fromJson(user)).toList();
  }
}
