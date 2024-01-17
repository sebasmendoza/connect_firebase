import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_firebase/models/brew.dart';

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

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot<Object?> snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Brew(
        name: (doc.data() as Map<String, dynamic>?)?['name'] ?? '',
        strength: (doc.data() as Map<String, dynamic>?)?['strength'] ?? 0,
        sugars: (doc.data() as Map<String, dynamic>?)?['sugars'] ?? '0',
      );
    }).toList();
  }


  // get brews stream
  Stream<List<Brew>> get brews {
    return groupCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

}