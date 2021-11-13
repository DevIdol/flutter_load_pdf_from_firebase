import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_pdf_from_firebase/load_pdf.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Load PDF From Firebase')),
        body: Center(
          child: InkWell(
            onTap: () {
              Get.to(const LoadPDF());
            },
            child: Container(
              color: Colors.blueGrey,
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Center(
                child: Text(
                  'Load PDF',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ));
  }
}
