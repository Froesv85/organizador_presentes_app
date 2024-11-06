import 'package:flutter/material.dart';
import '../models/presente.dart';
import '../screens/edit_presente_screen.dart';

class PresenteTile extends StatelessWidget {
  final Presente presente;
  final VoidCallback onDelete;

  PresenteTile({required this.presente, required this.onDelete});

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
                MaterialPageRoute(
                  builder: (context) => EditPresenteScreen(presente: presente),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
