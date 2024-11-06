import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/presente.dart';
import '../services/firebase_service.dart';

class AddPresenteScreen extends StatefulWidget {
  @override
  _AddPresenteScreenState createState() => _AddPresenteScreenState();
}

class _AddPresenteScreenState extends State<AddPresenteScreen> with SingleTickerProviderStateMixin {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final FirebaseService _firebaseService = FirebaseService();
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = ColorTween(
      begin: Color(0xFF0D47A1), // Azul escuro
      end: Color(0xFF66BB6A), // Verde claro
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    tituloController.dispose();
    descricaoController.dispose();
    precoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Presente')),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _animation.value!,
                  Color(0xFF42A5F5), // Azul claro
                  Color(0xFF2E7D32), // Verde escuro
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: tituloController,
                    decoration: InputDecoration(labelText: 'Título'),
                  ),
                  TextField(
                    controller: descricaoController,
                    decoration: InputDecoration(labelText: 'Descrição'),
                  ),
                  TextField(
                    controller: precoController,
                    decoration: InputDecoration(labelText: 'Preço'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final presente = Presente(
                        id: Uuid().v4(),
                        titulo: tituloController.text,
                        descricao: descricaoController.text,
                        preco: double.parse(precoController.text),
                        data: DateTime.now(),
                      );
                      _firebaseService.addPresente(presente).then((_) {
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
