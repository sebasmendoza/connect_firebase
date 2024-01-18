import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  // Find Group by Email (Group (door) > User (email)) and return Group Id
  Future<String?> findGroupByEmail(String userEmail) async {
    try {
      // Referencia a la colección 'Group'
      CollectionReference groupCollection = FirebaseFirestore.instance.collection('group');

      // Obtener todos los documentos de la colección 'Group'
      QuerySnapshot groupQuerySnapshot = await groupCollection.get();

      // Iterar sobre los documentos de 'Group'
      for (QueryDocumentSnapshot groupDoc in groupQuerySnapshot.docs) {
        // Obtener la referencia de la subcolección 'User' dentro de cada documento 'Group'
        CollectionReference userCollection = groupDoc.reference.collection('user');

        // Buscar si el correo electrónico existe en la subcolección 'User'
        QuerySnapshot userQuerySnapshot = await userCollection.where('email', isEqualTo: userEmail).get();

        // Si se encuentra el correo electrónico, devolver el ID del grupo
        if (userQuerySnapshot.docs.isNotEmpty) {
          return groupDoc.id;
        }
      }

      // Si el correo electrónico no se encuentra en ningún grupo
      return null;
    } catch (e) {
      print('Error al buscar el grupo por correo electrónico: $e');
      return null;
    }
  }

  Future<void> updateDoorState(int doorState, String? groupId) async {
    try {
      CollectionReference groupCollection = FirebaseFirestore.instance
          .collection('group');
      DocumentReference documentRef = groupCollection.doc(
          groupId);

      await documentRef.update({'door': doorState});

      print('Campo "door" actualizado correctamente.');
    } catch (e) {
      print('Error al actualizar el campo "door": $e');
    }
  }
}