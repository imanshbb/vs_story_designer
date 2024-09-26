import 'dart:typed_data';

import 'package:oktoast/oktoast.dart';
import 'package:super_clipboard/super_clipboard.dart';

void copyImage(Uint8List image, String fileName) async {
  final clipboard = SystemClipboard.instance;

  if (clipboard != null) {
    final item = DataWriterItem();
    if (extractExtension(fileName) == 'gif') {
      item.add(Formats.gif(image));
      await clipboard.write([item]).then(
        (value) {
          showToast('گیف با موفقیت در کلیپ‌بورد ذخیره شد');
        },
      );
      ;
    } else if (extractExtension(fileName) == 'webp') {
      item.add(Formats.webp(image));
      await clipboard.write([item]).then(
        (value) {
          showToast('تصویر با موفقیت در کلیپ‌بورد ذخیره شد');
        },
      );
    } else {
      item.add(Formats.png(image));
      await clipboard.write([item]).then(
        (value) {
          showToast('تصویر با موفقیت در کلیپ‌بورد ذخیره شد');
        },
      );
    }
  }
}

String extractExtension(String url) {
  List<String> parts = url.split('.');
  if (parts.length > 1) {
    return parts.last;
  } else {
    return ''; // آدرسی بدون پسوند
  }
}
