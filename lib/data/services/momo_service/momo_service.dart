import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MomoService {
  final url = 'https://sandbox.momodeveloper.mtn.com/v1_0';
  final url02 = 'https://sandbox.momodeveloper.mtn.com/collection';
  final ocpApimSubscriptionKey = "0965f45447014014b68354f0366ea5f5";
  String? xReferenceID;
  String? myApiKey;
  String? mytoken;

  String generateUUID() {
    const uuid = Uuid();
    String newUuid = uuid.v4();
    xReferenceID = newUuid;
    return xReferenceID!;
  }

  Future getApiUser() async {
    try {
      xReferenceID = null;
      final response = await http.post(
        Uri.parse('$url/apiuser'),
        headers: {
          'Content-Type': 'application/json',
          'Ocp-Apim-Subscription-Key': ocpApimSubscriptionKey,
          'X-Reference-Id': xReferenceID ?? generateUUID(),
        },
        body: jsonEncode(
          {
            'providerCallbackHost': 'string',
          },
        ),
      );

      if (response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("xReferenceID", xReferenceID ?? "");
        print("API user gotten : $xReferenceID");
        await getApiKey();
      } else if (response.statusCode == 401) {
        throw Exception();
      } else if (response.statusCode >= 500) {
        throw Exception();
      } else {
        throw Exception('Authentication failed: ${response.statusCode} code ');
      }
    } on SocketException {
      throw Exception("Erreur de connexion");
    } catch (e) {
      throw Exception('Authentication failed: $e');
    }
  }

  Future getApiKey() async {
    try {
      final response = await http.post(
        Uri.parse('$url/apiuser/$xReferenceID/apikey'),
        headers: {
          'Ocp-Apim-Subscription-Key': ocpApimSubscriptionKey,
          'X-Reference-Id': xReferenceID!,
        },
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> loginData = json.decode(response.body);

        if (loginData.containsKey("apiKey")) {
          final String apiKey = loginData["apiKey"];
          myApiKey = apiKey;
          final prefs = await SharedPreferences.getInstance();
          prefs.setString("myApiKey", myApiKey ?? "");
          print("Key gotten : $myApiKey");
        }
      } else if (response.statusCode == 401) {
        throw Exception();
      } else if (response.statusCode >= 500) {
        throw Exception();
      } else {
        throw Exception('Authentication failed: ${response.statusCode} code');
      }
    } on SocketException {
      throw Exception("Erreur de connexion");
    } catch (e) {
      throw Exception('Authentication failed: $e');
    }
  }

  Future getAccessToken() async {
    try {
      await getApiUser();

      final encodeUUIDKey = base64Encode(
        utf8.encode("$xReferenceID:$myApiKey"),
      );
      final authorization = "Basic $encodeUUIDKey";
      final response = await http.post(
        Uri.parse('$url02/token/'),
        headers: {
          'Ocp-Apim-Subscription-Key': ocpApimSubscriptionKey,
          'Authorization': authorization,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> loginData = json.decode(response.body);

        if (loginData.containsKey("access_token")) {
          final String token = loginData["access_token"];
          mytoken = token;
          print("token gotten : $mytoken");
        }
      } else if (response.statusCode == 401) {
        throw Exception();
      } else if (response.statusCode >= 500) {
        throw Exception();
      } else {
        throw Exception('Authentication failed: ${response.statusCode} code ');
      }
    } on SocketException {
      throw Exception("Erreur de connexion");
    } catch (e) {
      throw Exception('Authentication failed: $e');
    }
  }

  Future requestToPay(String numero) async {
    try {
      await getAccessToken();
      String? authorization = "Bearer $mytoken";
      final response = await http.post(
        Uri.parse('$url02/v1_0/requesttopay'),
        headers: {
          'Ocp-Apim-Subscription-Key': ocpApimSubscriptionKey,
          'Authorization': authorization,
          'X-Reference-Id': xReferenceID ?? "",
          'X-Target-Environment': 'sandbox',
        },
        body: jsonEncode(
          {
            "amount": "1000",
            "currency": "EUR",
            "externalId": "1234",
            "payer": {
              "partyIdType": "MSISDN",
              "partyId": "229$numero",
            },
            "payerMessage": "Fais-en bon usage",
            "payeeNote": "Loyer"
          },
        ),
      );

      if (response.statusCode == 202) {
        // final Map<String, dynamic> loginData = json.decode(response.body);
        return "Success";
      } else if (response.statusCode == 401) {
        throw Exception();
      } else if (response.statusCode >= 500) {
        throw Exception();
      } else {
        throw Exception('Authentication failed: ${response.statusCode} code ');
      }
    } on SocketException {
      throw Exception("Erreur de connexion");
    } catch (e) {
      throw Exception('Authentication failed: $e');
    }
  }
}
