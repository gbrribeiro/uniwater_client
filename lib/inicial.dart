import 'package:flutter/material.dart';
import 'edit_user.dart';
import 'main.dart';


void main() {
  runApp(principal());
}

class principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UniWaterHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UniWaterHomePage extends StatefulWidget {
  @override
  _UniWaterHomePageState createState() => _UniWaterHomePageState();
}

class _UniWaterHomePageState extends State<UniWaterHomePage> {
  double ligarValue = 15;
  double desligarValue = 90;
  double umidade = 80;
  bool controleUmidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'UniWater',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ' + _usernameController,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Ligar'),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Slider(
                        value: ligarValue,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: Colors.blue,
                        onChanged: controleUmidade
                            ? (value) {
                                setState(() {
                                  ligarValue = value;
                                });
                              }
                            : null,
                      ),
                    ),
                    Text('${ligarValue.toInt()}%'),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: umidade / 100,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.grass,
                          size: 40,
                          color: Colors.green,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${umidade.toInt()}%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Desligar'),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Slider(
                        value: desligarValue,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: Colors.blue,
                        onChanged: controleUmidade
                            ? (value) {
                                setState(() {
                                  desligarValue = value;
                                });
                              }
                            : null,
                      ),
                    ),
                    Text('${desligarValue.toInt()}%'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Controle por umidade'),
                Switch(
                  value: controleUmidade,
                  onChanged: (value) {
                    setState(() {
                      controleUmidade = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: '',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => edit_user()),
            );
          } else if (index == 2) {
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
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("Sair"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => login()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            }
        },
      ),
    );
  }
}
