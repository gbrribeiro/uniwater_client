import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irrigacao/Models/StreamingData.dart';
import 'package:irrigacao/Models/SystemParameters.dart';
import 'package:irrigacao/Models/User.dart';

class ApiService {
  final String baseUrl = "http://15.228.58.104:80";
  String apiKey = "";

  // Método GET
  Future<StreamingData?> getStreamingData() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/api/v1/StreamingData'));

      if (response.statusCode == 200) {
        return StreamingData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Erro ao buscar dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
      return null;
    }
  }

  // Método POST
  // Future<bool> postSystemConfig(SystemParameters params) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$baseUrl/api/v1/System'),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(data),
  //     );

  //     if (response.statusCode == 201) {
  //       return jsonDecode(response.body);
  //     } else {
  //       throw Exception('Erro ao enviar dados: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Erro: $e');
  //     return null;
  //   }
  // }

  //Autenticar
  Future authenticate(String login, String password) async {
    Map<String, String> body = {"username": login, "password": password};

    try {
      final response = await http.Client().post(
        Uri.parse('$baseUrl/api/v1/Identity/Login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            <String, String>{"username": login, "password": password}),
      );

      if (response.statusCode == 200) {
        apiKey = response.body;
      } else {
        throw Exception('Erro ao enviar dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
      return null;
    }
  }
}
