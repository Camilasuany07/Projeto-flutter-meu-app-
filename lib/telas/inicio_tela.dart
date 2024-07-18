import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gymapp_teste/_comum/inicio_modal.dart';
import 'package:flutter_gymapp_teste/modelos/exercicio_modelo.dart';
import 'package:flutter_gymapp_teste/servicos/autenticacao_servico.dart';
import 'package:flutter_gymapp_teste/telas/exercicio_tela.dart';

import '../modelos/sentimento_modelo.dart';

class InicioTela extends StatefulWidget {
  final User user;
  const InicioTela({super.key, required this.user});

  @override
  State<InicioTela> createState() => _InicioTelaState();
}

class _InicioTelaState extends State<InicioTela> {
  final List<ExercicioModelo> listaExercicios = [
    ExercicioModelo(
      id: "Ex01",
      nome: "Kata",
      treino: "Treino A",
      comoFazer: "Puxa",
    ),
    ExercicioModelo(
      id: "Ex01",
      nome: "Kumite",
      treino: "Treino B",
      comoFazer: "Aprendendo os movimentos",
    ),
    ExercicioModelo(
      id: "Ex01",
      nome: "Treino Livre",
      treino: "Treino A",
      comoFazer: "Praticando em luta",
    ),
    ExercicioModelo(
      id: "Ex01",
      nome: "Kata- Heian Shodan",
      treino: "Treino B",
      comoFazer: "Praticando movimentos",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus exercicios"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/mila.png"),
              ),
              accountName: Text((widget.user.displayName != null)
                  ? widget.user.displayName!
                  : ""),
              accountEmail: Text(widget.user.email!),
            ),
            ListTile(
              title: const Text("Quer saber como esse app foi feito?"),
              leading: const Icon(Icons.menu_book_rounded),
              dense: true,
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Deslogar"),
              dense: true,
              onTap: () {
                AutenticacaoServico().deslogar();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          mostrarModalInicio(context);
        },
      ),
      body: ListView(
        children: List.generate(
          listaExercicios.length,
          (index) {
            ExercicioModelo exercicioModelo = listaExercicios[index];
            return ListTile(
              title: Text(exercicioModelo.nome),
              subtitle: Text(exercicioModelo.treino),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ExercicioTela(exercicioModelo: exercicioModelo),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
