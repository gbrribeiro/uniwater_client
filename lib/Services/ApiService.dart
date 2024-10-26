import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irrigacao/Models/StreamingData.dart';
import 'package:irrigacao/Models/SystemParameters.dart';
import 'package:irrigacao/Models/User.dart';

class ApiService {
  final String baseUrl = "https://15.228.58.104:443";
  String apiKey = "";
  late User user;
  late SystemParameters parameters;
  late StreamingData data;

  // Método GET
  Future<StreamingData> getStreamingData() async {
    final response = await http.Client().get(
      Uri.parse('$baseUrl/api/v1/StreamingData'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
    );
    if (response.statusCode == 200) {
      data = StreamingData.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Erro ao buscar dados: ${response.statusCode}');
    }
  }

  // Método GET
  Future<SystemParameters> getSystemConfig() async {
    final response = await http.Client().get(
      Uri.parse('$baseUrl/api/v1/System'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
    );
    if (response.statusCode == 200) {
      parameters = SystemParameters.fromJson(jsonDecode(response.body));
      return parameters;
    }
    //TODO:
    // else if(response.statusCode == 401){
    //   authenticate(login, password)
    // }
    else {
      throw Exception('Erro ao buscar dados: ${response.statusCode}');
    }
  }

  //Método POST
  Future<bool> postSystemConfig(SystemParameters params) async {
    var data = params.toJson();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/System'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Erro ao enviar dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
      return false;
    }
  }

  //Autenticar
  Future<bool> authenticate(String login, String password) async {
    Map<String, String> body = {"username": login, "password": password};

    try {
      final response = await http.Client().post(
        Uri.parse('$baseUrl/api/v1/Identity/Login/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            <String, String>{"username": login, "password": password}),
      );

      if (response.statusCode == 200) {
        apiKey = response.body;
        user = await getActualUser(login);
        return true;
      } else {
        throw Exception('Erro ao enviar dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
      return false;
    }
  }

  //GET ACTUAL USER BY EMAIL
  Future<User> getActualUser(String email) async {
    final response = await http.Client().get(
      Uri.parse('$baseUrl/api/v1/Identity/User/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
    );
    List<dynamic> resp = jsonDecode(response.body);
    List<User> users = resp.map((x) => User.fromJson(x)).toList();
    return users.where((x) => x.normalizedEmail == email).first;
  }
}
