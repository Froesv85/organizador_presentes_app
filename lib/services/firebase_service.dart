import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/presente.dart';

class FirebaseService {
  final CollectionReference presentesCollection = FirebaseFirestore.instance.collection('presentes');

  Future<void> addPresente(Presente presente) {
    return presentesCollection.doc(presente.id).set(presente.toMap());
  }

  Future<void> updatePresente(Presente presente) {
    return presentesCollection.doc(presente.id).update(presente.toMap());
  }

  Future<void> deletePresente(String id) {
    return presentesCollection.doc(id).delete();
  }

  Stream<List<Presente>> getPresentes() {
    return presentesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Presente.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();
    });
  }
}
