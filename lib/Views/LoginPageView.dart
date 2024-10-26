import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irrigacao/Globals.dart';
import 'package:irrigacao/Views/UniWaterHomePage.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isWrongUser = false;

  void loginUser(String usuario, String senha, BuildContext context) async {
    bool success = await apiService.authenticate(usuario, senha);
    if (success == true) {
      setState(() {
        isWrongUser = false;
      });
      var currentConfig = await apiService.getSystemConfig();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UniWaterHomePage(
                    apiService.user,
                    currentConfig,
                  )));
    } else {
      //ERRO DE USUARIO NAO EXISTE
      setState(() {
        isWrongUser = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo UniWater
              Text(
                'UniWater',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Bem-vindo!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Faça Login para continuar.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),

              // Campo de Usuário
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de Senha
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              if (isWrongUser == true) ...[
                const Text(
                  "Usuário/Senha Incorreto!",
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 10),
              ],

              // Botão de Login
              ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar o botão de login
                  String nome = _usernameController.text;
                  String senha = _passwordController.text;

                  loginUser(nome, senha, context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Esqueci Minha Senha
              TextButton(
                onPressed: () {
                  // Ação para "Esqueci minha senha"
                  print('Esqueci minha senha');
                },
                child: const Text('ESQUECI MINHA SENHA'),
              ),
              const SizedBox(height: 16),

              // Entrar em contato via WhatsApp
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não tem uma conta? '),
                  GestureDetector(
                    onTap: () {
                      // Ação para entrar em contato via WhatsApp
                      print('Entrar em contato via WhatsApp');
                    },
                    child: Row(
                      children: [
                        Text(
                          'Entre em contato pelo ',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
