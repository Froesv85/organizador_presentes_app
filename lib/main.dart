import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Login automático
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: 'froesv@gmail.com',
    password: '123456', // Substitua pela senha correta
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organizador de Presentes',
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: GradientBackground(
        child: HomeScreen(),
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  final Widget child;

  GradientBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Organizador de Presentes'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: child,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Icon(Icons.home),
        ),
      ),
    );
  }
}

