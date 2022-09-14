import 'package:first_project/features/simple_app/domain/entities/simple_app.dart';

class SimpleAppListModel extends SimpleAppList {
  const SimpleAppListModel(List<SimpleAppModel> super.simpleAppList);

  factory SimpleAppListModel.fromJson(Map<String, dynamic> json) {
    print(json);
    List<SimpleAppModel> list = [];
    // return SimpleAppListModel(json == null ? [] : json.map((key, value) => SimpleApp(value["title"], value["pdfLinks"])).entries);
    json.forEach((key, value) {list.add(SimpleAppModel.fromJson(value));});
    return SimpleAppListModel(list);
  }
}

class SimpleAppModel extends SimpleApp {
  SimpleAppModel({super.title, super.pdfLinks, super.htmlTags});

  SimpleAppModel.fromJson(Map<String, dynamic> json) {
    print("------------------------------");
    json.forEach((key, value) {
      print(key);
      print(value);
    });
    title = json['title'];
    if (json['pdfLinks'] != null) {
      pdfLinks = <PdfLinks>[];
      json['pdfLinks'].forEach((v) {
        pdfLinks!.add(PdfLinksModel.fromJson(v));
      });
    }
    if (json['htmlTags'] != null) {
      htmlTags = <HtmlTags>[];
      json['htmlTags'].forEach((v) {
        htmlTags!.add(HtmlTagsModel.fromJson(v));
      });
    }
  }
}

class PdfLinksModel extends PdfLinks {
  PdfLinksModel({super.title, super.link});

  PdfLinksModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = super.title;
    data['link'] = super.link;
    return data;
  }
}

class HtmlTagsModel extends HtmlTags {
  HtmlTagsModel({super.title, super.html});

  HtmlTagsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = super.title;
    data['html'] = super.html;
    return data;
  }
}
