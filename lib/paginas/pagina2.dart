//import 'dart:developer';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
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
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      color: Colors.white,
//                      padding:
//                          const EdgeInsets.only(bottom: 0, top: 0, left: 10),
                      margin: const EdgeInsets.only(
                          bottom: 0, left: 10, right: 10, top: 10),
                      child: ListTile(
                        visualDensity: VisualDensity.comfortable,
                        title: Text(lista2[index].toString()),
                        subtitle: const Text('(13) 920003427'),
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
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed: null,
      ),
      title: Text(
        'Clientes',
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.bars,
              size: 20,
              color: Colors.grey[600],
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ],
      elevation: 2,
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }
}

class BlocoPesquisa extends StatelessWidget {
  const BlocoPesquisa({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Chip(
                backgroundColor: Colors.teal,
                label: Text(
                  'Favoritos',
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 14,
                    letterSpacing: .2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                visualDensity: VisualDensity.compact,
                avatar: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: FaIcon(
                    FontAwesomeIcons.solidHeart,
                    size: 15,
                    color: dgreen,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.teal,
                label: Text(
                  'Tratando',
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 14,
                    letterSpacing: .2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                visualDensity: VisualDensity.comfortable,
                avatar: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: FaIcon(
                    FontAwesomeIcons.tooth,
                    size: 15,
                    color: dgreen,
                  ),
                ),
              ),
              Chip(
                backgroundColor: Colors.teal,
                label: Text(
                  'Remarcou',
                  style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: .2,
                      fontWeight: FontWeight.w600),
                ),
                visualDensity: VisualDensity.comfortable,
                avatar: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: FaIcon(
                    FontAwesomeIcons.calendarAlt,
                    size: 15,
                    color: dgreen,
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
                  height: 50,
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      30,
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
                width: 40,
                height: 40,
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
