import 'package:flutter/material.dart';
import '../models/presente.dart';
import '../services/firebase_service.dart';

class EditPresenteScreen extends StatefulWidget {
  final Presente presente;

  EditPresenteScreen({required this.presente});

  @override
  _EditPresenteScreenState createState() => _EditPresenteScreenState();
}

class _EditPresenteScreenState extends State<EditPresenteScreen> {
  late TextEditingController tituloController;
  late TextEditingController descricaoController;
  late TextEditingController precoController;
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    tituloController = TextEditingController(text: widget.presente.titulo);
    descricaoController = TextEditingController(text: widget.presente.descricao);
    precoController = TextEditingController(text: widget.presente.preco.toString());
  }

  @override
  void dispose() {
    tituloController.dispose();
    descricaoController.dispose();
    precoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Presente')),
      body: Padding(
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
                final updatedPresente = Presente(
                  id: widget.presente.id,
                  titulo: tituloController.text,
                  descricao: descricaoController.text,
                  preco: double.parse(precoController.text),
                  data: widget.presente.data,
                );
                _firebaseService.updatePresente(updatedPresente).then((_) {
                  Navigator.pop(context);
                });
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
