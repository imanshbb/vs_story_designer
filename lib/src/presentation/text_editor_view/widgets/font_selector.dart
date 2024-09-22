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
        case FontType.laleZar:
          text.add('لاله‌زار');
          break;
        case FontType.vazirMatn:
          text.add('لاله‌زار');
          break;
        case FontType.rubik:
          text.add('لاله‌زار');
          break;
        case FontType.handJet:
          text.add('لاله‌زار');
          break;
        case FontType.blaka:
          text.add('لاله‌زار');
          break;
        default:
          text.add('لاله‌زار');
      }
    }

    return Consumer2<TextEditingNotifier, ControlNotifier>(
      builder: (context, editorNotifier, controlNotifier, child) {
        return Container(
          height: _size.width * 0.1,
          width: _size.width,
          alignment: Alignment.center,
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
                child: Container(
                  height: _size.width * 0.3,
                  width: _size.width * 0.3,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: index == editorNotifier.fontFamilyIndex
                          ? Colors.white
                          : Colors.black.withOpacity(0.4),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.white)),
                  child: Center(
                    child: Text(
                      text[index],
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
                              fontSize: 8.0,
                              color: index == editorNotifier.fontFamilyIndex
                                  ? Colors.red
                                  : Colors.white,
                              fontWeight: FontWeight.bold),
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
