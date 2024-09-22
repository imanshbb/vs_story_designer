// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/control_provider.dart';
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
        case FontType.vazirMatn:
          text.add('وزیر متن');
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

    return Consumer2<TextEditingNotifier, ControlNotifier>(
      builder: (context, editorNotifier, controlNotifier, child) {
        return SizedBox(
          height: _size.width * 0.13,
          width: _size.width,
          // alignment: Alignment.center,
          child: PageView.builder(
            controller: editorNotifier.fontFamilyController,
            itemCount: controlNotifier.fontList!.length,
            onPageChanged: (index) {
              // editorNotifier.text = .
              // editorNotifier.fontFamilyIndex = index;
              HapticFeedback.heavyImpact();
            },
            physics: const BouncingScrollPhysics(),
            allowImplicitScrolling: true,
            pageSnapping: false,
            itemBuilder: (context, index) {
              return AnimatedOnTapButton(
                onTap: () {
                  editorNotifier.fontFamilyIndex = index;
                  editorNotifier.fontFamilyController.jumpToPage(index);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Container(
                    height: _size.width * 0.017,
                    width: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: index == editorNotifier.fontFamilyIndex
                      //     ? Colors.white
                      //     : Colors.black.withOpacity(0.4),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      gradient: index == editorNotifier.fontFamilyIndex
                          ? const LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white,
                              ],
                            )
                          : const LinearGradient(
                              colors: [
                                Color(0xff274589),
                                Color(0xff5AB7C2),
                              ],
                              transform: GradientRotation(
                                  BorderSide.strokeAlignCenter),
                            ),
                    ),
                    child: Center(
                      child: Text(
                        text[index],
                        textAlign: TextAlign.center,
                        maxLines: 1,
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
                              fontSize: 17.0,
                              color: index == editorNotifier.fontFamilyIndex
                                  ? const Color(0xff274589)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
