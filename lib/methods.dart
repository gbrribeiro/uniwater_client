import 'package:flutter/material.dart';
import 'main.dart';

void testaLogin(String nome, String senha, BuildContext context) {
  if (nome.isEmpty || senha.isEmpty) {
    // fazer o amostragem de falta dados fdp
  } else if (nome == "eduardo" && senha == "12345") {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => principal()));
  } else {
    // nome ou senha incorreto
  }
}
