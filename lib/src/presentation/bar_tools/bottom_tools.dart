// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:vs_media_picker/vs_media_picker.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/control_provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/draggable_widget_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/painting_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/scroll_notifier.dart';
import 'package:vs_story_designer/src/domain/sevices/save_as_image.dart';
import 'package:vs_story_designer/src/presentation/bar_tools/Model/modal.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/item_type.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/text_animation_type.dart';
import 'package:vs_story_designer/src/presentation/widgets/animated_onTap_button.dart';

// import 'package:vs_story_designer/src/presentation/widgets/tool_button.dart';

class BottomTools extends StatefulWidget {
  final GlobalKey contentKey;
  final Function(String imageUri) onDone;
  final Widget? onDoneButtonStyle;
  final Function? renderWidget;

  /// editor background color
  final Color? editorBackgroundColor;
  const BottomTools(
      {super.key,
      required this.contentKey,
      required this.onDone,
      this.renderWidget,
      this.onDoneButtonStyle,
      this.editorBackgroundColor});

  @override
  State<BottomTools> createState() => _BottomToolsState();
}

class _BottomToolsState extends State<BottomTools>
    with TickerProviderStateMixin {
  late final Future<Response>? response;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _createVideo = false;
    return Consumer4<ControlNotifier, ScrollNotifier, DraggableWidgetNotifier,
        PaintingNotifier>(
      builder: (_, controlNotifier, scrollNotifier, itemNotifier,
          paintingNotifier, __) {
        return Container(
          height: 95,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// preview gallery
              Row(
                children: [
                  Container(
                    // width: _size.width / 3,
                    // height: _size.width / 3,
                    padding: const EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      child: _preViewContainer(
                        /// if [model.imagePath] is null/empty return preview image
                        child: controlNotifier.mediaPath.isEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: GestureDetector(
                                  onTap: () {
                                    /// scroll to gridView page
                                    if (controlNotifier.mediaPath.isEmpty) {
                                      scrollNotifier.pageController
                                          .animateToPage(1,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.ease);
                                    }
                                  },
                                  child: const CoverThumbnail(
                                    thumbnailQuality: 150,
                                  ),
                                ))

                            /// return clear [imagePath] provider
                            : GestureDetector(
                                onTap: () {
                                  /// clear image url variable
                                  controlNotifier.mediaPath = '';
                                  itemNotifier.draggableWidget.removeAt(0);
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  color: Colors.transparent,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              // if (controlNotifier.mediaPath.isEmpty)
              //   _selectColor(
              //       controlProvider: controlNotifier,
              //       onTap: () {
              //         if (controlNotifier.gradientIndex >=
              //             controlNotifier.gradientColors!.length - 1) {
              //           setState() {
              //             controlNotifier.gradientIndex = 0;
              //           }
              //         } else {
              //           setState() {
              //             controlNotifier.gradientIndex += 1;
              //           }
              //         }
              //       }),

              /// center logo
              // controlNotifier.middleBottomWidget != null
              //     ? Center(
              //         child: Container(
              //             width: _size.width / 3,
              //             height: 80,
              //             alignment: Alignment.bottomCenter,
              //             child: controlNotifier.middleBottomWidget),
              //       )
              //     : Center(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Image.asset(
              //               'assets/images/instagram_logo.png',
              //               package: 'vs_story_designer',
              //               color: Colors.white,
              //               height: 42,
              //             ),
              //             const Text(
              //               'Story Designer',
              //               style: TextStyle(
              //                   color: Colors.white38,
              //                   letterSpacing: 1.5,
              //                   fontSize: 9.2,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       ),

              /// save final image to gallery

              AnimatedOnTapButton(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const ModalWidget(
                        model: 'sticker',
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 1.5)),
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 2),
                      child: Icon(Icons.emoji_emotions, size: 28),
                    ),
                  ]),
                ),
              ),
              AnimatedOnTapButton(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const ModalWidget(
                        model: 'bg',
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 1.5)),
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 2),
                      child: Icon(Icons.image, size: 28),
                    ),
                  ]),
                ),
              ),
              AnimatedOnTapButton(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const ModalWidget(
                        model: 'gif',
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 1.5)),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 2),
                        child: Icon(Icons.gif, size: 28),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedOnTapButton(
                  onTap: () async {
                    String pngUri;
                    if (paintingNotifier.lines.isNotEmpty ||
                        itemNotifier.draggableWidget.isNotEmpty) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Card(
                                    color: Colors.white,
                                    child: Container(
                                        padding: const EdgeInsets.all(50),
                                        child:
                                            const CircularProgressIndicator())),
                              ],
                            );
                          });

                      for (var element in itemNotifier.draggableWidget) {
                        if (element.type == ItemType.gif ||
                            element.animationType != TextAnimationType.none) {
                          // setState(() {
                          _createVideo = true;
                          // });
                        }
                      }
                      if (_createVideo) {
                        debugPrint('creating video');
                        await widget.renderWidget!();
                      } else {
                        debugPrint('creating image');
                        await takePicture(
                                contentKey: widget.contentKey,
                                context: context,
                                saveToGallery: false,
                                fileName: controlNotifier.folderName)
                            .then((bytes) {
                          Navigator.of(context, rootNavigator: true).pop();
                          if (bytes != null) {
                            pngUri = bytes;
                            widget.onDone(pngUri);
                          } else {
                            // ignore: avoid_print
                            print("error");
                          }
                        });
                      }
                    } else {
                      showToast('یک تغییر ایجاد کنید');
                    }
                    // setState(() {
                    _createVideo = false;
                    // });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: widget.onDoneButtonStyle ??
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: Colors.white, width: 1.5)),
                          child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 0, right: 2),
                                  child: Icon(Icons.share_sharp, size: 28),
                                ),
                              ]),
                        ),
                  ))

              // Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: Container(
              //     width: _size.width / 4,
              //     alignment: Alignment.centerRight,
              //     padding: const EdgeInsets.only(right: 0),
              //     child: Transform.scale(
              //       scale: 0.9,
              //       child: StatefulBuilder(
              //         builder: (_, setState) {
              //         },
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _preViewContainer({child}) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.4, color: Colors.white)),
      child: child,
    );
  }
}

class ModalWidget extends StatefulWidget {
  final String model;
  const ModalWidget({
    super.key,
    required this.model,
  });

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget>
    with TickerProviderStateMixin {
  bool isLoading = false;
  dartz.Either<dynamic, ModalApi>? modalData;
  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (value) async {
        print('3');
        setState(() {
          isLoading = true;
        });
        modalData = await callApi();
        print('4');
        setState(() {
          isLoading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GifController _controller = GifController(vsync: this);
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : modalData!.fold(
              (l) {
                return const Text('اینترنت خود را بررسی کنید');
              },
              (r) {
                print('5');
                if (widget.model == 'gif') {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: r.gif!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 100,
                        height: 100,
                        child: Gif(
                          controller: _controller,
                          image: AssetImage(
                            'https://farahigram.com${r.gif![index].url!}',
                          ),
                          autostart: Autostart.loop,
                          placeholder: (context) => const Text('Loading...'),
                          onFetchCompleted: () {
                            _controller.reset();
                            _controller.forward();
                          },
                        ),
                      );
                    },
                  );
                } else if (widget.model == 'bg') {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: r.background!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                            'https://farahigram.com${r.background![index].url!}'),
                      );
                    },
                  );
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: r.gif!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 100,
                        height: 100,
                        child: Gif(
                          controller: _controller,
                          image: AssetImage(
                            'https://farahigram.com${r.gif![index].url!}',
                          ),
                          autostart: Autostart.loop,
                          placeholder: (context) => const Text('Loading...'),
                          onFetchCompleted: () {
                            _controller.reset();
                            _controller.forward();
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
    );
  }

  Future<dartz.Either<dynamic, ModalApi>> callApi() async {
    late ModalApi coverbuilderModel;

    try {
      var response = await Dio().post(
        'https://farahigram.com/MainApp/AppImageDownloadWithoutToken',
        data: {
          'token': '',
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print('1');
        coverbuilderModel = ModalApi.fromJson(
          response.data,
        );
        print('2');
      }
      return dartz.Left(coverbuilderModel);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        coverbuilderModel = ModalApi.fromJson(e.response?.data);
        return const dartz.Left(null);
      }
      return const dartz.Left(null);
    }
  }
}
