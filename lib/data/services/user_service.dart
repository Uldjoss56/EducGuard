import 'dart:convert';
import 'package:eduguard/ui/registration_connexion/registration/model/authentificated_user.dart';
import 'package:http/http.dart' as http;

class UserService {
  final url = Uri.https(
    'eduguard-44872-default-rtdb.firebaseio.com',
    'users.json',
  );
  Future<void> createUser(Map<String, dynamic> data) async {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        data,
      ),
    );
    if (response.statusCode >= 400) {
      throw Exception('Failed to create user');
    }
  }

  Future<List<User>> getAllUser() async {
    //final response = await http.get(url);
    //final Map<String, dynamic> listUser = json.decode(response.body);
    final List<User> loadedUser = [];

    return loadedUser;
  }

  Future<void> deleteUser(id) async {
    final url = Uri.https(
      'backend-entrainement-default-rtdb.firebaseio.com',
      'users/$id.json',
    );
    final response = await http.delete(url);
    if (response.statusCode >= 400) {}
  }
}
