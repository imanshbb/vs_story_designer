class ModalApi {
  List<ItemsModel>? sticker;
  List<ItemsModel>? gif;
  List<ItemsModel>? background;

  ModalApi({
    required this.sticker,
    required this.gif,
    required this.background,
  });

  ModalApi.fromJson(Map json) {
    if (json['sticker'] != null) {
      sticker = [];
      json['sticker'].forEach((v) {
        sticker!.add(ItemsModel.fromJson(v));
      });
    }
    if (json['gif'] != null) {
      gif = [];
      json['gif'].forEach((v) {
        gif!.add(ItemsModel.fromJson(v));
      });
    }
    if (json['background'] != null) {
      background = [];
      json['background'].forEach((v) {
        background!.add(ItemsModel.fromJson(v));
      });
    }
  }
}

class ItemsModel {
  String? title;
  String? url;
  ItemsModel({
    required this.title,
    required this.url,
  });

  ItemsModel.fromJson(Map json) {
    title = json['title'];
    url = json['url'];
  }
}
