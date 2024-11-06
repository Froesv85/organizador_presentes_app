import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/presente.dart';
import '../services/firebase_service.dart';

class AddPresenteScreen extends StatefulWidget {
  @override
  _AddPresenteScreenState createState() => _AddPresenteScreenState();
}

class _AddPresenteScreenState extends State<AddPresenteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Presente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final presente = Presente(
                      id: Uuid().v4(),
                      titulo: _tituloController.text,
                      descricao: _descricaoController.text,
                      data: DateTime.now(),
                    );
                    _firebaseService.addPresente(presente).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
