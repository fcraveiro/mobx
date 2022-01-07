import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class Pdf1 extends StatefulWidget {
  const Pdf1({Key? key}) : super(key: key);

  @override
  _Pdf1State createState() => _Pdf1State();
}

class _Pdf1State extends State<Pdf1> {
  static const int _initialPage = 2;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;
  late PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/imagens/AmascaraEoRosto.pdf'),
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('PdfView example'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.navigate_before),
                onPressed: () {
                  _pdfController.previousPage(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 100),
                  );
                },
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '$_actualPageNumber/$_allPagesCount',
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.navigate_next),
                onPressed: () {
                  _pdfController.nextPage(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 100),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  if (isSampleDoc) {
                    _pdfController.loadDocument(PdfDocument.openAsset(
                        'assets/imagens/Personalidade-Patologica.pdf'));
                  } else {
                    _pdfController.loadDocument(PdfDocument.openAsset(
                        'assets/imagens/AmascaraEoRosto.pdf'));
                  }
                  isSampleDoc = !isSampleDoc;
                },
              )
            ],
          ),
          body: PdfView(
            documentLoader: const Center(child: CircularProgressIndicator()),
            pageLoader: const Center(child: CircularProgressIndicator()),
            controller: _pdfController,
            onDocumentLoaded: (document) {
              setState(() {
                _allPagesCount = document.pagesCount;
              });
            },
            onPageChanged: (page) {
              setState(() {
                _actualPageNumber = page;
              });
            },
          ),
        ),
      );
}
