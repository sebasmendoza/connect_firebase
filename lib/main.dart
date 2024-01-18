// import 'package:connect_firebase/screens/wrapper.dart';
// import 'package:connect_firebase/services/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:connect_firebase/models/user.dart';
//
// import 'firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<Member?>.value(
//       value: AuthService().user,
//       initialData: null,
//       child: MaterialApp(
//         // home: Wrapper(),
//         home: Container(
//           child: FloatingActionButton(onPressed: () {  },
//             child: Text("Hello"),
//           ),
//         )
//       ),
//     );
//   }
// }
//

// ------------------------------------------------------------------------------------


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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          updateDoorState();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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




