import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getTasks() {
    return _db.collection('tasks').snapshots();
  }

  Future<void> addTask(String title, String description) {
    return _db.collection('tasks').add({
      'title': title,
      'description': description,
      'status': 'open',
      'assignedTo': '',
    });
  }

  Future<void> updateTask(String id, String title, String description, String status, String assignedTo) {
    return _db.collection('tasks').doc(id).update({
      'title': title,
      'description': description,
      'status': status,
      'assignedTo': assignedTo,
    });
  }

  Future<void> deleteTask(String id) {
    return _db.collection('tasks').doc(id).delete();
  }
}
