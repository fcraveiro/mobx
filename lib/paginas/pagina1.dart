import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({Key? key}) : super(key: key);

  @override
  _Pagina1State createState() => _Pagina1State();
}

Color corTextField = Colors.yellow;
Color corFundoStack1 = const Color(0xFFBDBDBD);
Color corFundoStack2 = const Color(0xFFEEEEEE);
Color corSombraStack2 = const Color(0xFFD6D6D6);
Color corTextoAppBar = const Color(0xFF1565C0);
Color corTextoElevated = const Color(0xFF4DB6AC);
Color corBorderElevated = Colors.yellow; // const Color(0xFF4DB6AC);
Color corFundoElevated = Colors.white;
Color corFillTextField = Colors.yellow;
Color corFillFocusTextField = Colors.purple;
Color corIconeTextField = Colors.white;
Color corLabelTextField = Colors.purple;

final TextEditingController _nomeController = TextEditingController();

class _Pagina1State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white, // const Color(0xFFEEEEEE),
//      extendBody: true,
//      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
          heightFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      color: corFundoStack1, //  Color(0xFFBDBDBD),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: corFundoStack2, // Color(0xFFEEEEEE),
                      boxShadow: [
                        BoxShadow(
                            color: corSombraStack2, //Color(0xFFD6D6D6),
                            offset: const Offset(
                              0.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                            blurRadius: 6.0,
                            spreadRadius: 3.0),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 10,
                          height: 50,
                          margin: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                height: 50,
                                width: 40,
                                child: Icon(Icons.arrow_back),
                              ),
                              SizedBox(
                                height: 50,
                                width: 250,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pacientes',
                                      style: TextStyle(
                                        fontFamily: 'RobotoSlab',
                                        fontSize: 20,
                                        color:
                                            corTextoAppBar, // Color(0xFF1565C0),
                                        letterSpacing: .2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                                width: 40,
                                child: Icon(Icons.menu),
                              ),
                            ],
                          ),
                        ),
                        // Abaixar ou Subir Search
                        const SizedBox(
                          height: 0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: 400,
                              padding: const EdgeInsets.only(top: 10),
                              margin: const EdgeInsets.only(
                                  top: 5, left: 25, right: 25),
                              child: TextField(
                                controller: _nomeController,
                                cursorColor: Colors.grey, // Colors.grey,
                                onChanged: (value) {
//                                  pesqNome(value);
                                },
                                style: TextStyle(
                                  color: corTextField, // Colors.black54,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color:
                                        corIconeTextField, // Color(0xFF4DB6AC),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () => {
                                      _nomeController.clear(),
//                                      mostraTodos(),
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color:
                                          corIconeTextField, // Color(0xFF4DB6AC),
                                    ),
                                  ),
                                  labelText: "Nome",
                                  labelStyle: TextStyle(
                                    color:
                                        corLabelTextField, // Color(0xFF4DB6AC),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: corFillTextField, // Colors.white,
                                      width: 3,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          corFillFocusTextField, // Colors.white,
                                      width: 3,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Subir ou Baixar Botões
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 10,
                          height: 50,
                          margin: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              favorito,
                              tratando,
                              limpar,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget favorito = ElevatedButton.icon(
    label: Text(
      'Favoritos',
      style: estiloDoTexto15(),
    ),
    icon: FaIcon(
      FontAwesomeIcons.solidHeart,
      size: 16,
      color: corTextoElevated,
    ),
    onPressed: () {
      log('Favorito');
    },
    style: estilo(),
  );

  Widget tratando = ElevatedButton.icon(
    label: Text(
      'Tratando',
      style: estiloDoTexto15(),
    ),
    icon: FaIcon(
      FontAwesomeIcons.tooth,
      size: 16,
      color: corTextoElevated,
    ),
    onPressed: () {
      log('Tratando');
    },
    style: estilo(),
  );

  Widget limpar = ElevatedButton.icon(
    label: Text(
      'Limpar',
      style: estiloDoTexto15(),
    ),
    icon: FaIcon(
      FontAwesomeIcons.solidWindowClose,
      size: 18,
      color: corTextoElevated,
    ),
    onPressed: () {
      log('Limpar');
    },
    style: estilo(),
  );
}

estilo() {
  ElevatedButton.styleFrom(
    elevation: 3,
    minimumSize: const Size(95, 35),
    primary: corFundoElevated,
    side: BorderSide(
      width: 1,
      color: corBorderElevated, // Color(0xFFBDBDBD),
    ),
  );
}

estiloDoTexto15() {
  TextStyle(
      fontFamily: 'Nunito',
      fontSize: 15,
      color: corTextoElevated,
      letterSpacing: .3);
}
