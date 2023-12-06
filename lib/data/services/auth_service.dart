import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eduguard/data/services/api/api.dart';
import 'package:eduguard/ui/registration_connexion/registration/model/authentificated_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Dio dio = Api.api();
  String? responseMessage;
  User? _user;

  Future createUser({
    required name,
    required phone,
    required email,
    required password,
  }) async {
    try {
      final response = await dio.post(
        "api/register",
        data: {
          "fullName": name,
          "email": email,
          "password": password,
          "phoneNumber": phone,
          "profileImagePath": "null",
          "livingAddress": "null",
          "profession": "null",
          "statusMatrimonial": "null",
          "birthday": "null",
          "nationalCardID": "null",
          "revenuAnnuel": "null",
        },
      );
      if (response.statusCode == 201) {
        return "Enregistre ${response.data["message"]}";
      }
    } on SocketException {
      responseMessage = "Vérifiez votre connexion internet";
      return '';
    } catch (e) {
      if (e is DioException &&
          e.response != null &&
          e.response!.statusCode == 422) {
        Exception('Erreur 400: ${e.response!.data}');
        return "hd";
      } else if (e is SocketException) {
      } else {
        Exception('Erreur inattendue: $e');
      }
    }
  }

  Future connectUser({required email, required password}) async {
    try {
      final response = await dio.post(
        "api/login",
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> loginData = response.data;
        print(loginData);
        if (loginData.containsKey('token')) {
          final String token = loginData['token'];
          final prefs = await SharedPreferences.getInstance();
          prefs.setString("userToken", token);

          final user = User.fromJson(loginData['user']);
          setUser(user);
        }

        return "Connecte ${response.data["message"]}";
      }
    } on SocketException {
      responseMessage = "Vérifiez votre connexion internet";
      return "Vérifiez votre connexion internet";
    } catch (e) {
      if (e is DioException &&
          e.response != null &&
          e.response!.statusCode == 422) {
        Exception('Erreur 400: ${e.response!.data}');
        return "Réessayez";
      } else if (e is SocketException) {
      } else {
        Exception('Erreur inattendue: $e');
        return "Réessayez";
      }
    }
  }

  setUser(User user) {
    _user = user;
  }

  getUser() {
    return _user;
  }

  Future<void> disconnectUser() async {
    //await _firebase.signOut();
  }
}
