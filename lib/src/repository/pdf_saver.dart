import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class PdfHandlerInterface {
  Future<void> createResume(GlobalKey key);

  Future<Uint8List> capturePng(GlobalKey key);

  Future<GlobalKey> createPDF(GlobalKey key);

  Future<String?> findLocalPath();

  Future<Directory> prepareSaveDir();
}

class PdfHandler implements PdfHandlerInterface {
  // generate the final resume in pdf.
  @override
  Future<GlobalKey> createResume(GlobalKey key) async => createPDF(key);

  @override
  Future<Uint8List> capturePng(GlobalKey key) async {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Future<Directory> prepareSaveDir() async {
    var localPath = (await findLocalPath())!;
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    return savedDir;
  }

  @override
  Future<String?> findLocalPath() async {
    if (Platform.isAndroid) {
      return "/storage/emulated/0/Download";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }

  @override
  Future<GlobalKey> createPDF(GlobalKey key) async {
    try {
      final directory = await prepareSaveDir();

      final path = '${directory.path}/resume_${key.hashCode}.pdf';
      final pdf = pw.Document();
      final image = pw.MemoryImage(await capturePng(key));
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

    return key;
  }
}
