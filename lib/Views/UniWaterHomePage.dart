import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irrigacao/Globals.dart';
import 'package:irrigacao/Models/StreamingData.dart';
import 'package:irrigacao/Models/SystemParameters.dart';
import 'package:irrigacao/Models/User.dart';
import 'package:irrigacao/edit_user.dart';

class UniWaterHomePage extends StatefulWidget {
  final User actualUser;
  SystemParameters parameters;
  UniWaterHomePage(this.actualUser, this.parameters, {super.key});

  @override
  _UniWaterHomePageState createState() => _UniWaterHomePageState();
}

class _UniWaterHomePageState extends State<UniWaterHomePage> {
  late StreamingData data =
      StreamingData(humidity: 0, temperature: 0, internalClock: DateTime.now());
  bool controleUmidade = true;

  void startRepeatingFunction() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      var ret = await apiService.getStreamingData();
      setState(() {
        data = ret;
      });
    });
  }

  void saveChanges() async {
    bool success = await apiService.postSystemConfig(widget.parameters);
    if (success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Salvo com sucesso!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    startRepeatingFunction();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
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
            const Text(
              //TODO: USUARIO NOME
              'Bem-vindo! ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Ligar'),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Slider(
                        value:
                            widget.parameters.humidityOnPercentage.toDouble(),
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: Colors.blue,
                        onChanged: controleUmidade
                            ? (value) {
                                setState(() {
                                  widget.parameters.humidityOnPercentage =
                                      value.toInt();
                                });
                              }
                            : null,
                      ),
                    ),
                    Text('${widget.parameters.humidityOnPercentage.toInt()}%'),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: data.humidity / 100,
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
                          '${data.humidity.toInt()}%',
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
                        value:
                            widget.parameters.humidityOffPercentage.toDouble(),
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: Colors.blue,
                        onChanged: controleUmidade
                            ? (value) {
                                setState(() {
                                  widget.parameters.humidityOffPercentage =
                                      value.toInt();
                                });
                              }
                            : null,
                      ),
                    ),
                    Text('${widget.parameters.humidityOffPercentage}%'),
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
            SizedBox(height: 25),
            FilledButton(
                onPressed: () => saveChanges(), child: const Text("Salvar"))
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
            icon: Icon(Icons.access_time),
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
          }
        },
      ),
    );
  }
}
