import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Confirmação de Logout'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout), // Ícone de logout
              onPressed: () {
                _showLogoutConfirmationDialog(context); // Função que exibe o diálogo
              },
            ),
          ],
        ),
        body: Center(
          child: Text('Clique no ícone de sair no AppBar'),
        ),
      ),
    );
  }

  // Função que exibe o diálogo de confirmação
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Deseja sair?"),
          content: Text("Você tem certeza que deseja sair da aplicação?"),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: Text("Sair"),
              onPressed: () {
                // Lógica de logout
                print("Saindo...");
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
