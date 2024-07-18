import 'package:flutter/material.dart';
import 'package:flutter_gymapp_teste/_comum/minhas_cores.dart';
import 'package:flutter_gymapp_teste/componentes/decoracao_campo_autenticacao.dart';

mostrarModalInicio(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: MinhasCores.violetaTopoGradiente,
    isDismissible: false,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      ),
    ),
    builder: (context) {
      return const ExercicioModal();
    },
  );
}

class ExercicioModal extends StatefulWidget {
  const ExercicioModal({super.key});

  @override
  State<ExercicioModal> createState() => _ExercicioModalState();
}

class _ExercicioModalState extends State<ExercicioModal> {
  TextEditingController _nomeCtrl = TextEditingController();
  TextEditingController _treinoCtrl = TextEditingController();
  TextEditingController _anotacoesCtrl = TextEditingController();
  TextEditingController _sentindoCtrl = TextEditingController();

  bool isCarregando = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Adicionar Exercicio",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _nomeCtrl,
                decoration: getAuthenticationInputDecoration(
                  "Qual o nome do exercicio?",
                  icon: const Icon(
                    Icons.abc, 
                    color: Colors.white,
                  ),
              ),
            ),
             const SizedBox(height: 16),
             TextFormField(
                controller: _treinoCtrl,
                decoration: getAuthenticationInputDecoration(
                  "Qual o treino pertence?",
                  icon: const Icon(
                    Icons.list_alt_rounded, 
                    color: Colors.white,
                  ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
                controller: _anotacoesCtrl,
                decoration: getAuthenticationInputDecoration(
                  "Quais anotações voce tem?",
                  icon: const Icon(
                    Icons.notes_rounded, 
                    color: Colors.white,
                  ),
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16),
            TextFormField(
                controller: _sentindoCtrl,
                decoration: getAuthenticationInputDecoration(
                  "Como voce está se sentindo?",
                  icon: const Icon(
                    Icons.emoji_emotions_rounded, 
                    color: Colors.white,
                  ),
              ),
              maxLines: null,
            ),
          ],
          ),
            ],
          ),
           
          ElevatedButton(
            onPressed: () {},
            child: const Text("Criar Exercicio"),
          ),
        ],
       ),
      ),
    );
  }
}
