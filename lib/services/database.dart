import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  // collection reference
  final CollectionReference groupCollection = FirebaseFirestore.instance.collection('group');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await groupCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    }, SetOptions(merge: true));
  }

}