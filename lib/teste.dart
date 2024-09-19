import 'package:flutter/material.dart';

// Certifique-se de que esta é uma classe de widget válida
class EditUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Usuário')),
      body: Center(
        child: Text('Tela de Edição de Usuário'),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) { // Por exemplo, se o item de índice 1 for o EditUserScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditUserScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Principal')),
      body: Center(
        child: Text('Tela Principal'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Editar',
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: HomeScreen()));
