import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isDoorOpen = false; // Variable que controla la apertura/cierre de la puerta

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    // Iniciar la animación al cargar la pantalla
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animación de Puerta'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('group').doc('kDkvYHedDoPjuYp6AiMx').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          bool newDataIsDoorOpen = snapshot.data?['door'] == 1;

          if (newDataIsDoorOpen != isDoorOpen) {
            // Cambiar el estado de la puerta si hay cambios en la base de datos
            isDoorOpen = newDataIsDoorOpen;
            if (isDoorOpen) {
              _controller.forward(); // Abrir la puerta
            } else {
              _controller.reverse(); // Cerrar la puerta
            }
          }

          return Center(
            child: GestureDetector(
              onTap: () {
                // Cambiar el estado de la puerta al hacer clic
                setState(() {
                  isDoorOpen = !isDoorOpen;
                  if (isDoorOpen) {
                    _controller.forward(); // Abrir la puerta
                  } else {
                    _controller.reverse(); // Cerrar la puerta
                  }
                });
              },
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(isDoorOpen ? _animation.value * 3.14 / 2 : 0.0),
                    child: Image.asset('assets/web_door.jpg', width: 500.0, height: 500.0),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
