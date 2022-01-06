import 'package:flutter/material.dart';
import 'package:mobxa/paginas/pagina2.dart';
import '/paginas/pagina1.dart';
import 'widgets/widgets.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Pagina1(),
                  ),
                );
              },
              child: txtnu('Lista de Pacientes', 17, 4),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Testo(),
                  ),
                );
              },
              child: txtnu('Lista', 17, 4),
            ),
          ],
        ),
      ),
    );
  }
}
