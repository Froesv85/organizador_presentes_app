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
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _tituloController;
  late TextEditingController _descricaoController;
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _tituloController = TextEditingController(text: widget.presente.titulo);
    _descricaoController = TextEditingController(text: widget.presente.descricao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Presente'),
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
                      id: widget.presente.id,
                      titulo: _tituloController.text,
                      descricao: _descricaoController.text,
                      data: widget.presente.data,
                    );
                    _firebaseService.updatePresente(presente).then((_) {
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
