import 'dart:io';
import 'package:fruta_delivery_app/models/pedido_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;


Future<String> gerarPDF(PedidoModel pedido) async {
  Future<Directory?>? _appDocumentsDirectory = getApplicationDocumentsDirectory();
  String path = "";
  await _appDocumentsDirectory.then((value) => {
    path = value?.path.toString() ?? "",
  });

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Text('Hello World!'),
      ),
    ),
  );

  final file = File('$path/example.pdf');
  await file.writeAsBytes(await pdf.save());
  return '$path/example.pdf';

}


