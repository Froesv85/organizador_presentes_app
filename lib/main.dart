import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_presente_screen.dart';
import 'screens/edit_presente_screen.dart';

void main() {
  runApp(OrganizadorPresentesApp());
}

class OrganizadorPresentesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organizador de Presentes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add': (context) => AddPresenteScreen(),
        '/edit': (context) => EditPresenteScreen(presente: ModalRoute.of(context)!.settings.arguments as Presente),
      },
    );
  }
}
