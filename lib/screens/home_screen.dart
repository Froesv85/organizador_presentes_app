import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizador_presentes_app/widgets/presente_tile.dart';
import '../models/presente.dart';
import 'add_presente_screen.dart';

class HomeScreen extends StatelessWidget {
  final CollectionReference presentesRef = FirebaseFirestore.instance.collection('presentes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presentes'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D47A1), // Azul escuro
              Color(0xFF42A5F5), // Azul claro
              Color(0xFF66BB6A), // Verde claro
              Color(0xFF2E7D32), // Verde escuro
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StreamBuilder(
          stream: presentesRef.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                final presente = Presente.fromMap(doc.data() as Map<String, dynamic>, doc.id);
                return PresenteTile(presente: presente);
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddPresenteScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF0D47A1), // Azul escuro
      ),
    );
  }
}
