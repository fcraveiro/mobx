//import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Testo extends StatefulWidget {
  const Testo({Key? key}) : super(key: key);

  @override
  _TestoState createState() => _TestoState();
}

Color dgreen = const Color(0xFF54D3C2);

List lista2 = [];

List lista = [
  'Prof. Hilda Hanke Goncalves',
  'Cidade De Descanso',
  'Cidade De Ilhota',
  'Porto Uniao',
  'Cidade De Videira',
  'Dionizio Markovicz',
  'Prof. Hilda Hanke Goncalves',
  'Cidade De Descanso',
  'Cidade De Ilhota',
  'Porto Uniao',
  'Cidade De Videira',
  'Dionizio Markovicz',
];

int maior = 0;
int menor = 0;
int conta = 0;

class _TestoState extends State<Testo> {
  @override
  void initState() {
    separa();
    coco();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: const MyAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BlocoPesquisa(),
            /*
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Text('Total = ${conta.toString()}'),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Text('Maior = ${maior.toString()}'),
                ],
              ),
            ),
*/

            Expanded(
              child: ListView.builder(
                  itemCount: lista2.length,
                  itemBuilder: (__, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 65,
//                            color: Colors.blue,
//                          color: const Color(0xFFEEEEEE),
                            child: ListTile(
                              visualDensity: VisualDensity.comfortable,
                              title: Text(
                                lista2[index].toString(),
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 18,
                                  letterSpacing: .2,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                '(13) 920003427',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 15,
                                  letterSpacing: .2,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Divider(
                              height: 2,
                              color: Colors.grey[300],
                              thickness: 2,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  separa() async {
    for (var i in lista) {
      conta = conta + 1;
      if (i.toString().length < 16) {
        menor = menor + 1;
      } else {
        maior = maior + 1;
//        log(i);
        lista2.add(
          'Rua ' + i,
        );
      }
    }
    setState(() {});

/*    
    log('Lista 1 = ${lista.length}');
    log('Lista 2 = ${lista2.length}');
    log('Result  = ${lista2[1000].toString()}');
*/
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
//          color: Colors.grey[800],
          size: 20,
        ),
        onPressed: null,
      ),
      title: Text(
        'Clientes',
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w400,
          letterSpacing: .3,
        ),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              FontAwesomeIcons.bars,
              size: 20,
              color: Colors.white,
//              color: Colors.grey[600],
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ],
      elevation: 0,
      backgroundColor: Colors.teal[700],
      centerTitle: true,
    );
  }
}

class BlocoPesquisa extends StatelessWidget {
  const BlocoPesquisa({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[700],
//      color: Colors.grey[400],
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Chip(
                backgroundColor: Colors.white, // dgreen, // Colors.teal,
                label: Text(
                  'Favoritos',
                  style: GoogleFonts.montserratAlternates(
                    color: Colors.grey[600],
                    //                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: .3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.all(5),
                avatar: CircleAvatar(
                  backgroundColor: dgreen,
                  child: const FaIcon(
                    FontAwesomeIcons.solidHeart,
                    size: 12,
                    color: Colors.white, // dgreen,

//                    color: dgreen,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.white, // Colors.teal,
                shadowColor: Colors.black,
                padding: const EdgeInsets.all(5),

                label: Text(
                  'Tratando',
                  style: GoogleFonts.montserratAlternates(
                    color: Colors.grey[600],
                    fontSize: 13,
                    letterSpacing: .3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                visualDensity: VisualDensity.compact,
                avatar: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    backgroundColor: dgreen,
                    child: const FaIcon(FontAwesomeIcons.tooth,
                        size: 12,
                        color: Colors.white // Colors.grey[500], // dgreen,

//                    color: dgreen,
                        ),
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.white, // dgreen, // Colors.teal,
                padding: const EdgeInsets.all(5),

                label: Text(
                  'Remarcou',
                  style: GoogleFonts.montserratAlternates(
                      color: Colors.grey[600],
                      fontSize: 13,
                      letterSpacing: .3,
                      fontWeight: FontWeight.w600),
                ),
                visualDensity: VisualDensity.compact,
                avatar: CircleAvatar(
                  backgroundColor: dgreen, // Colors.white,
                  child: const FaIcon(
                    FontAwesomeIcons.calendarAlt,
                    size: 12,
                    color: Colors.white, // dgreen,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      22,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      ),
                      contentPadding: const EdgeInsets.all(5),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 35,
                height: 35,
                margin: const EdgeInsets.only(right: 08),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const ImageIcon(
                    AssetImage('assets/imagens/cancelar.png'),
                    color: Colors.white,
                    size: 17,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    primary: dgreen,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 20,
          ),
        ],
      ),
    );
  }
}

random(min, max) {
  var rn = Random();
  return min + rn.nextInt(max - min);
}

coco() {
  for (var i = 0; i < 10; i++) {
    // ignore: avoid_print
    var ff = '(13) 9' +
        random(1000, 9999).toString() +
        '-' +
        random(1000, 9999).toString();
    var gg =
        '139' + random(1000, 9999).toString() + random(1000, 9999).toString();
    // ignore: avoid_print
    print(ff);
    // ignore: avoid_print
    print(gg);
  }
}
