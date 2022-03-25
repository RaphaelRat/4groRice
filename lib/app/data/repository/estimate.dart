import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/estimate_model.dart';
import '../providers/estimate/estimate.dart' as estimate_provider;

Future<List<Estimativa>> getEstimativas() => estimate_provider.getEstimativas();

Stream<QuerySnapshot<Map<String, dynamic>>> getEstimativasStream() => estimate_provider.getEstimativasStream();

void addEstimativa(Estimativa estimativa) => estimate_provider.addEstimativa(estimativa);
