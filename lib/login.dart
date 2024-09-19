import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(login());
}

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo UniWater
            Text(
              'UniWater',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Bem-vindo!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Por favor faça Login para continuar.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 32),

            // Campo de Usuário
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuário',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Campo de Senha
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Botão de Login
            ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão de login
                print('Usuário: ${_usernameController.text}');
                print('Senha: ${_passwordController.text}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('LOGIN', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16),

            // Esqueci Minha Senha
            TextButton(
              onPressed: () {
                // Ação para "Esqueci minha senha"
                print('Esqueci minha senha');
              },
              child: Text('ESQUECI MINHA SENHA'),
            ),
            SizedBox(height: 16),

            // Entrar em contato via WhatsApp
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Não tem uma conta? '),
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
        ),
      ),
    );
  }
}
