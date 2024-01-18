import 'package:connect_firebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_firebase/services/database.dart';

import 'login.dart';

class DoorStateWidget extends StatelessWidget {
  final String? groupId;
  const DoorStateWidget({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado de la Puerta'),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // Deshabilita el botón de retroceso predeterminado
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Llama a la función de cierre de sesión del servicio de autenticación
              AuthService().signOut();
              // Navega a la pantalla de inicio de sesión (puedes ajustar esto según tu estructura de navegación)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('group').doc(groupId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          bool isOpened = snapshot.data!['door'] == 1;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                isOpened
                    ? Image.asset(
                  'assets/door_open.png',
                  width: 200.0,
                  height: 200.0,
                )
                    : Image.asset(
                  'assets/door_close.png',
                  width: 200.0,
                  height: 200.0,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    DatabaseService().updateDoorState(isOpened ? 0 : 1, groupId);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      isOpened ? Colors.red : Colors.green,
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(200.0, 50.0),
                    ),
                  ),
                  child: Text(
                    isOpened ? 'Cerrar puerta' : 'Abrir puerta',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}