import 'dart:io';
import 'dart:typed_data';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class EmsPdfService {
  Future<Uint8List> generateEMSPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Container(
                alignment: pw.Alignment.topCenter,
                child: pw.Center(
                  child: pw.Text(
                    "CUCI MOBIL",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Divider(thickness: 2),
              pw.SizedBox(height: 20),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Kasir : Egi Renaldi",
                      style: pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "No Transaksi : 091234",
                      style: pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    pw.Text(
                      "Tgl : 26-06-2024",
                      style: pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              pw.Divider(thickness: 2),
              pw.SizedBox(
                height: 20,
              ),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 5),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Nama Pelanggan : ",
                      style: pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    pw.Text(
                      "Egi Renaldi",
                      style: pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 5),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Nama Produk : ",
                      style: pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    pw.Text(
                      "Cuci VIP",
                      style: pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 5),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Harga Produk : ",
                      style: pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    pw.Text(
                      "Rp.15.000",
                      style: pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 5),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Quantity : ",
                      style: pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    pw.Text(
                      "3",
                      style: pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Divider(thickness: 2),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 20),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Total Belanja : Rp.100.000",
                      style: pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    pw.Text(
                      "Total Bayar : Rp.100.000",
                      style: pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              pw.Divider(thickness: 2),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 20),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Uang Kembali : Rp.100.000",
                      style: pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              pw.Divider(thickness: 2),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "-- Terimakasih --",
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenFile.open(filePath);
  }
}
