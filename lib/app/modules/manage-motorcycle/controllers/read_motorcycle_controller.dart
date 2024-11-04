import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
final CollectionReference motor = db.collection('Manage MotorCycle');

// final DocumentSnapshot snapshot = await motor.doc('runtime').get();