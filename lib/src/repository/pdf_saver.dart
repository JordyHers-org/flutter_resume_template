import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

/// An abstract class that defines a PDFHandler, which
/// is responsible for saving PDF files to disk or to an external
/// service.
///
/// This class provides a common interface for handling PDF
/// files and can be extended to implement different storage
/// strategies such as saving files to local disk, uploading
/// files to a cloud storage service, or emailing PDF files to
/// recipients.
///
/// To implement a specific storage strategy, extend this class
/// and implement the `savePdf` method, which takes in a
/// `PdfDocument` object and saves it to the desired location.
/// The `PdfDocument` class provides an API for generating PDF
/// documents with custom layouts, fonts, and other features.
///
/// The `PDFHandler` class also defines a `getFileName` method
/// that generates a unique filename for the PDF file based on
/// the current timestamp and other parameters. This helps prevent
/// filename collisions and makes it easy to manage
/// multiple PDF files.
///
/// To use a specific implementation of `PDFHandler`, simply create
/// an instance of the subclass and call the `savePdf`
/// method with a `PdfDocument` object. The PDF file will be saved
/// to the specified location based on the implementation
/// details of the subclass.

abstract class PdfHandlerInterface {
  /// createResume
  Future<void> createResume(GlobalKey key);

  /// capturePng
  Future<Uint8List> capturePng(GlobalKey key);

  /// createPDF
  Future<GlobalKey> createPDF(GlobalKey key);

  /// findLocalPath
  Future<String?> findLocalPath();

  /// prepareSaveDir
  Future<Directory> prepareSaveDir();
}

/// This part contains the implementation of the pdf handler.
/// The pdf handler only locally saves a pdf version copy of
/// your Resume. To add more specificities you may need to
/// create a more complete functions that allow you to customize
/// more.
///
///

class PdfHandler implements PdfHandlerInterface {
  /// This function should receive the GlobalKey and generate the
  /// final resume in pdf.
  ///
  @override
  Future<GlobalKey> createResume(GlobalKey key) async => createPDF(key);

  /// The [capturePng] will create a png file screenshot of everything
  /// that are visually present on the device screen.
  ///
  @override
  Future<Uint8List> capturePng(GlobalKey key) async {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  /// This function handles the directory path for the file to be saved.
  ///
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

  /// The [findLocalPath] defines the path based on the platform
  ///
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
