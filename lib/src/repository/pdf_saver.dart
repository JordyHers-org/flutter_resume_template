import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class PdfHandlerInterface {
  Future<void> createResume(GlobalKey key);
  Future<Uint8List> _capturePng(GlobalKey key);
  Future<void> _createPDF(GlobalKey key);
}

class PdfHandler implements PdfHandlerInterface {
  // generate the final resume in pdf.
  @override
  Future<void> createResume(GlobalKey key) async => _createPDF(key);

  @override
  Future<Uint8List> _capturePng(GlobalKey key) async {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Future<void> _createPDF(GlobalKey key) async {
    final directory;
    try {
      if (Platform.isAndroid) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = (await getDownloadsDirectory()) ??
            getApplicationDocumentsDirectory();
      }

      final path = '${directory.path}/resume_${key.hashCode}.pdf';
      final pdf = pw.Document();
      final image = pw.MemoryImage(await _capturePng(key));
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Center(child: pw.Image(image)),
        ),
      );

      final file = File(path);
      await file.writeAsBytes(await pdf.save());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
