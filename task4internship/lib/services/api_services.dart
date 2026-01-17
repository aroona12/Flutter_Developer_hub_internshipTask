import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class ApiService {

  Future<List<UserModel>> getUsers() async {

    final url = Uri.parse("https://reqres.in/api/users?page=1");

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "User-Agent": "Mozilla/5.0 Flutter"
      },
    );

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List list = data['data'];

      return list.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception("Server Error: ${response.statusCode}");
    }
  }
}
