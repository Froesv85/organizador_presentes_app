import 'package:flutter/material.dart';
import '../models/presente.dart';
import '../services/firebase_service.dart';
import 'presente_tile.dart';
import 'add_presente_screen.dart';
import 'edit_presente_screen.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organizador de Presentes'),
      ),
      body: StreamBuilder<List<Presente>>(
        stream: _firebaseService.getPresentes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final presentes = snapshot.data ?? [];
          return ListView.builder(
            itemCount: presentes.length,
            itemBuilder: (context, index) {
              final presente = presentes[index];
              return PresenteTile(presente: presente, onDelete: () => _firebaseService.deletePresente(presente.id));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPresenteScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
