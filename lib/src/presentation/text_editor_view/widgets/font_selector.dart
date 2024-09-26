// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/control_provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/draggable_widget_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/painting_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/text_editing_notifier.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/font_family.dart';
import 'package:vs_story_designer/src/presentation/widgets/animated_onTap_button.dart';
import 'package:vs_story_designer/vs_story_designer.dart';

class FontSelector extends StatelessWidget {
  const FontSelector({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> text = [];

    var _size = MediaQuery.of(context).size;
    for (int i = 0; i < AppFonts.fontFamilyListENUM.length; i++) {
      switch (AppFonts.fontFamilyListENUM[i]) {
        case FontType.openSans:
          text.add('عادی');
          break;
        case FontType.laleZar:
          text.add('لاله‌زار');
          break;
        case FontType.alibabaBlackWoff:
          text.add('علی‌بابا');
          break;
        case FontType.iranKharazmi:
          text.add('ایران‌خارزمی');
          break;
        case FontType.iranBlack:
          text.add('ایران‌بلک');
          break;
        case FontType.iranNastaliqYasDL:
          text.add('ایران‌نسخ‌طلیق');
          break;
        case FontType.iranSansXBold:
          text.add('ایران‌سنس‌ضخیم');
          break;
        case FontType.iranSansXHeavy:
          text.add('ایران‌سنس‌بزرک');
          break;
        case FontType.iranSansXRegular:
          text.add('ایران‌سنس‌نازک');
          break;
        case FontType.irCompset:
          text.add('کامپوست');
          break;
        case FontType.irCompsetBold:
          text.add('‌‌کامپوست‌ضخیم');
          break;
        case FontType.irCompsetIra:
          text.add('‌‌کامپوست‌ایرا');
          break;
        case FontType.irDastNevis:
          text.add('‌‌ای‌ار دست‌نویس');
          break;
        case FontType.irsansYasDL:
          text.add('ایران‌سنس');
          break;
        case FontType.kALAMEHBLACK:
          text.add('کلمه‌ بلک');
          break;
        case FontType.kalamehWebBold:
          text.add('کلمه‌ وب‌ضخیم');
          break;
        case FontType.mjSaeedYasDL:
          text.add('سعید');
          break;
        case FontType.peydaMedium:
          text.add('پیدامتوسط');
          break;
        case FontType.peydaBlack:
          text.add('پیدابلک');
          break;
        case FontType.peydaThin:
          text.add('پیدانازک');
          break;
        case FontType.pinarBold:
          text.add('پینار‌ضخیم');
          break;
        case FontType.pinarMedium:
          text.add('پینارمتوسط');
          break;
        case FontType.rokhFaNumBlack:
          text.add('رخ‌بلک');
          break;
        case FontType.rokhFaNumNormal:
          text.add('رخ‌متوسط');
          break;
        case FontType.yagutBoldYasDLcom:
          text.add('یاقوت‌ضخیم');
          break;
        case FontType.yaldaNormalYasDLCom:
          text.add('یاقوت‌متوسط');
          break;
        case FontType.zarBoldYasDLcom:
          text.add('زارضخیم');
          break;
        case FontType.zarNormalYasDLcom:
          text.add('زارمتوسط');
          break;
        case FontType.rubik:
          text.add('روبیک');
          break;
        case FontType.handJet:
          text.add('هندجت');
          break;
        case FontType.blaka:
          text.add('بلاکا');
          break;
        case FontType.qahiri:
          text.add('qahiri');
          break;
        case FontType.marhey:
          text.add('marhey');
          break;
        case FontType.gulzar:
          text.add('گلزار');
          break;
        case FontType.harmattan:
          text.add('harmattan');
          break;
        case FontType.kufam:
          text.add('کوفام');
          break;

        default:
          text.add(AppFonts.fontFamilyListENUM[i].toString().substring(9));
      }
    }

    return Consumer4<TextEditingNotifier, ControlNotifier,
        DraggableWidgetNotifier, PaintingNotifier>(
      builder: (context, editorNotifier, controlNotifier,
          draggableWidgetNotifier, paintingNotifier, child) {
        return SizedBox(
          height: 65,
          width: _size.width,
          // alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: ListView.builder(
              controller: editorNotifier.fontFamilyController,
              itemCount: controlNotifier.fontList!.length,
              scrollDirection: Axis.horizontal,

              // onPageChanged: (index) {
              //   // editorNotifier.text = .
              //   // editorNotifier.fontFamilyIndex = index;
              //   HapticFeedback.heavyImpact();
              // },
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                double scale = max(0.8,
                    (1 - (editorNotifier.fontFamilyIndex - index).abs()) + 0.2);
                return GestureDetector(
                  onTap: () {
                    editorNotifier.fontFamilyIndex = index;
                    editorNotifier.fontFamilyController.jumpToPage(index);
                  },
                  child: Transform.scale(
                    scale:
                        scale, // استفاده از Transform برای تغییر مقیاس آیتم‌ها

                    child: Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: Container(
                        width: 200 * scale,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            // color: index == editorNotifier.fontFamilyIndex
                            //     ? Colors.white
                            //     : Colors.black.withOpacity(0.4),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: index == editorNotifier.fontFamilyIndex
                                  ? [
                                      Colors.white,
                                      Colors.white,
                                    ]
                                  : [
                                      const Color.fromARGB(255, 69, 111, 209),
                                      const Color.fromARGB(255, 98, 191, 201),
                                    ],
                            )),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: AutoSizeText(
                              text[index],
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              minFontSize: 6.0,
                              maxFontSize: 18.0,
                              style: AppFonts.getTextThemeENUM(
                                      controlNotifier.fontList![index])
                                  .bodyLarge!
                                  .merge(const TextStyle(
                                      // fontFamily: controlNotifier.fontList![index],
                                      // package: controlNotifier.isCustomFontList
                                      //     ? null
                                      //     : 'vs_story_designer'
                                      ))
                                  .copyWith(
                                    fontSize: 18.0,
                                    color:
                                        index == editorNotifier.fontFamilyIndex
                                            ? const Color(0xff274589)
                                            : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
