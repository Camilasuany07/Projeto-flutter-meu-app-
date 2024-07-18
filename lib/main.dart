import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gymapp_teste/telas/autenticacao_tela.dart';
import 'package:flutter_gymapp_teste/telas/exercicio_tela.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gymapp_teste/telas/inicio_tela.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RoteadorTerla(),
    );
  }
}

class RoteadorTerla extends StatelessWidget {
  const RoteadorTerla({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InicioTela(user: snapshot.data!,);
        } else {
          return const AutenticacaoTela();
        }
      },
    );
  }
}

