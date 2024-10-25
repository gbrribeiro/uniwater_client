import 'package:flutter/material.dart';
import 'inicial.dart';
import 'main.dart';

void main() => runApp(edit_user());

class edit_user extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniWater',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserForm(),
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Save form logic
      print("Form saved");
    }
  }

  void _resetToDefault() {
    // Reset to default logic
    setState(() {
      nameController.clear();
      lastNameController.clear();
      emailController.clear();
      passwordController.clear();
      newPasswordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(labelText: 'Sobrenome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu sobrenome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Usuário'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: newPasswordController,
                decoration: InputDecoration(labelText: 'Nova senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua nova senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: Text('Salvar'),
                  ),
                  ElevatedButton(
                    onPressed: _resetToDefault,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Restaurar para padrão'),
                  )
                ],
              ),
              Spacer(),
              BottomNavigationBar(
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
                currentIndex:
                    0, 
                selectedItemColor: Colors.blue,
                onTap: (index) {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              edit_user()),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => principal()),
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
            ],
          ),
        ),
      ),
    );
  }
}
