import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class LoadPDF extends StatefulWidget {
  const LoadPDF({Key? key}) : super(key: key);

  @override
  _LoadPDFState createState() => _LoadPDFState();
}

class _LoadPDFState extends State<LoadPDF> {
  final GlobalKey<SfPdfViewerState> _globalKey = GlobalKey();
  late SfPdfViewer _document;
  bool _loading = true;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    _loadPDF();
  }

  _loadPDF() async {
    final _doc = SfPdfViewer.network((await firebase_storage
        .FirebaseStorage.instance
        .ref('flutter.pdf')
        .getDownloadURL()));
    setState(() {
      _document = _doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PDF From Firebase'),
          centerTitle: true,
        ),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _document,
        key: _globalKey);
  }
}
