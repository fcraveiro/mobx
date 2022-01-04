import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({Key? key}) : super(key: key);

  @override
  _Pagina1State createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina1'),
        centerTitle: true,
      ),
      body: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
      ),
    );
  }
}
