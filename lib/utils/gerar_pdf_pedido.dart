import 'dart:io';
import 'package:fruta_delivery_app/models/pedido_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

Future<String> gerarPDF(PedidoModel pedido) async {
  Future<Directory?>? _appDocumentsDirectory =
      getApplicationDocumentsDirectory();
  String path = "";
  await _appDocumentsDirectory.then((value) => {
        path = value?.path.toString() ?? "",
      });

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
        build: (pw.Context context) => pw.Column(children: [
          pw.Text('Pedido Nº: ${pedido.id.toString()}', textAlign:  pw.TextAlign.center, style: pw.TextStyle(
            fontSize: 20,
            fontWeight: pw.FontWeight.bold
          )),
          pw.SizedBox(height: 32),
          pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Item'),
                    pw.Text('Quantidade'),
                    pw.Text('Valor Kg'),
                    pw.Text('Valor Total'),
                  ]),
              pw.SizedBox(height: 32),
              pw.Column(
                  children: pedido.pedidoItems
                      .map(
                        (item) => pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Expanded(
                              flex: 2,
                                child: pw.Text(item.nome.toString(), textAlign:  pw.TextAlign.left),
                              ),
                              pw.Expanded(
                                  flex: 2,
                                child: pw.Text(item.quantidade.toString(), textAlign:  pw.TextAlign.center),
                              ),
                              pw.Expanded(
                                  flex: 2,
                                child: pw.Text('R\$ ${item.valorUnitario.toString()}', textAlign:  pw.TextAlign.center),
                              ),
                              pw.Expanded(
                                  flex: 2,
                                  child: pw.Text(
                                      'R\$ ${(item.valorUnitario * item.quantidade)
                                          .toStringAsFixed(2)}', textAlign:  pw.TextAlign.right)),
                            ]),
                      )
                      .toList()),
                  pw.SizedBox(height: 24),
                    pw.Align(
                      alignment: pw.Alignment.bottomRight,
                      child:
                    pw.Text('Total R\$: ${pedido.totalValor?.toStringAsFixed(2)}', textAlign:  pw.TextAlign.right, style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold
                    )),
                  ),
            ])),
  );

  final file = File('$path/pedido_${pedido.id.toString()}.pdf');
  await file.writeAsBytes(await pdf.save());
  return '$path/pedido_${pedido.id.toString()}.pdf';
}
