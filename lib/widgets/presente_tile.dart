import 'package:flutter/material.dart';
import '../models/presente.dart';
import '../services/firebase_service.dart';
import '../screens/edit_presente_screen.dart';

class PresenteTile extends StatelessWidget {
  final Presente presente;

  PresenteTile({required this.presente});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(presente.titulo),
      subtitle: Text(presente.descricao),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EditPresenteScreen(presente: presente)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              FirebaseService().deletePresente(presente.id);
            },
          ),
        ],
      ),
    );
  }
}
