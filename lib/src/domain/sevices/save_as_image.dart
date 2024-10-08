import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';

Future takePicture(
    {required contentKey,
    required BuildContext context,
    required saveToGallery,
    required fileName}) async {
  try {
    /// converter widget to image
    RenderRepaintBoundary boundary =
        contentKey.currentContext.findRenderObject();

    ui.Image image = await boundary.toImage(pixelRatio: 3);

    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    /// create file
    final String dir = (await getApplicationDocumentsDirectory()).path;
    String imagePath = '$dir/${fileName}_${DateTime.now()}.png';
    File capturedFile = File(imagePath);
    await capturedFile.writeAsBytes(pngBytes);

    if (saveToGallery) {
      try {
        await Gal.putImageBytes(
          pngBytes,
        );
        return true;
      } catch (e) {
        return false;
      }
    } else {
      return imagePath;
    }
  } catch (e) {
    debugPrint('exception => $e');
    return false;
  }
}
