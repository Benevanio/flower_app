import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(FlowerApp());

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simulação de Flor',
      home: FlowerPage(),
    );
  }
}

class FlowerPage extends StatelessWidget {
  const FlowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Simulação de Flor')),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: FlowerWidget(),
      ),
    );
  }
}

class FlowerWidget extends StatefulWidget {
  const FlowerWidget({super.key});

  @override
  _FlowerWidgetState createState() => _FlowerWidgetState();
}

class _FlowerWidgetState extends State<FlowerWidget> {
  final Random _random = Random();

  Color _randomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        for (int i = 0; i < 6; i++)
          Transform.rotate(
            angle: (pi / 3) * i,
            child: Petal(
              onTap: () {
                setState(() {});
              },
              color: _randomColor(),
            ),
          ),
        Center(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.yellow[700],
          ),
        ),
      ],
    );
  }
}

class Petal extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const Petal({super.key, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        margin: EdgeInsets.only(bottom: 100),
      ),
    );
  }
}
