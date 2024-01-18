import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isOpened = false;

  void toggleDoor() {
    setState(() {
      isOpened = !isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Center(
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
                  toggleDoor();
                  updateDoorState();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    isOpened ? Colors.green : Colors.red,
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(200.0, 50.0),
                  ),
                ),
                child: Text(
                  isOpened ? 'Cerrar puerta' : 'Abrir puerta',
                  style: TextStyle(fontSize: 20.0,  color: Colors.white),
                ),
              ),
            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<void> updateDoorState() async {
  try {
    // Referencia a la colección 'group' y al documento que contiene el campo 'door'.
    CollectionReference groupCollection = FirebaseFirestore.instance.collection('group');
    DocumentReference documentRef = groupCollection.doc('zJcb2Ks87S5RTcs6Twfq'); // Reemplaza 'your_document_id' con el ID real de tu documento.

    // Realiza la actualización del campo 'door' a 1.
    await documentRef.update({'door': 0});

    print('Campo "door" actualizado correctamente.');
  } catch (e) {
    print('Error al actualizar el campo "door": $e');
  }
}




