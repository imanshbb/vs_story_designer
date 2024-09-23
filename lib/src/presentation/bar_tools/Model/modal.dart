class ModalApi {
  List<StickerModel>? sticker;
  List<GifModel>? gif;
  List<BackModel>? background;

  ModalApi({
    required this.sticker,
    required this.gif,
    required this.background,
  });

  ModalApi.fromJson(Map json) {
    if (json['sticker'] != null) {
      sticker = [];
      json['sticker'].forEach((v) {
        sticker!.add(StickerModel.fromJson(v));
      });
    }
    if (json['gif'] != null) {
      gif = [];
      json['gif'].forEach((v) {
        gif!.add(GifModel.fromJson(v));
      });
    }
    if (json['background'] != null) {
      background = [];
      json['background'].forEach((v) {
        background!.add(BackModel.fromJson(v));
      });
    }
  }
}

class StickerModel {
  String? title;
  String? url;
  StickerModel({
    required this.title,
    required this.url,
  });

  StickerModel.fromJson(Map json) {
    title = json['title'];
    url = json['url'];
  }
}

class GifModel {
  String? title;
  String? url;
  GifModel({
    required this.title,
    required this.url,
  });

  GifModel.fromJson(Map json) {
    title = json['title'];
    url = json['url'];
  }
}

class BackModel {
  String? title;
  String? url;
  BackModel({
    required this.title,
    required this.url,
  });

  BackModel.fromJson(Map json) {
    title = json['title'];
    url = json['url'];
  }
}
