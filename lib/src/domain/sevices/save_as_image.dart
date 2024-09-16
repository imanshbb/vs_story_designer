import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';

Future takePicture(
    {required contentKey,
    required BuildContext context,
    required saveToGallery,
    required fileName}) async {
  try {
    /// create file
    final String dir = (await getApplicationDocumentsDirectory()).path;
    String imagePath = '$dir/${fileName}_${DateTime.now()}.png';

    if (saveToGallery) {
      await Gal.putImage(fileName);
      print('object22222');
      return true;
    } else {
      return imagePath;
    }
  } catch (e) {
    debugPrint('exception => $e');
    return false;
  }
}
