import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tes_pdf/services/ems_pdf_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final EmsPdfService emspdfservice = EmsPdfService();
  List _orders = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/orders.json");
    final data = await json.decode(response);
    setState(() {
      _orders = data['records'];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pdf Generator'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final data = await emspdfservice.generateEMSPDF();
              emspdfservice.savePdfFile("Invoice Transactions", data);
            },
            child: const Text("Generate Pdf"),
          ),
        ),
      ),
    );
  }
}
