import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/estimate_model.dart';

Future<List<Estimativa>> getEstimativas() async {
  final _instance = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser?.uid;

  CollectionReference categories = _instance.collection('Usuarios').doc(userId).collection('Estimativas');

  List<Estimativa> lista = [];

  final data = await categories.orderBy('data').get();

  for (var estimativa in data.docs) {
    lista.add(Estimativa.fromMap(estimativa.data() as Map<String, dynamic>));
  }

  return lista;
}

Stream<QuerySnapshot<Map<String, dynamic>>> getEstimativasStream() {
  final userId = FirebaseAuth.instance.currentUser?.uid;

  return FirebaseFirestore.instance.collection('Usuarios').doc(userId).collection('Estimativas').snapshots();
}

void addEstimativa(Estimativa estimativa) {
  final _instance = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser?.uid;

  _instance.collection('Usuarios').doc(userId).collection('Estimativas').doc().set(estimativa.toMap());
}
