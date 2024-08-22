import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:master_go_replication/api/model.dart';

class ApiService {
  final String apiUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<UserModel> users =
          body.map((dynamic item) => UserModel.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
