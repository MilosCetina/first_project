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
  SimpleAppModel({required super.title, required super.pdfLinks, required super.htmlTags});

  factory SimpleAppModel.fromJson(Map<String, dynamic> json) {
    print("------------------------------");
    json.forEach((key, value) {
      print(key);
      print(value);
    });
    List<PdfLinksModel> pdfLinksList = <PdfLinksModel>[];
    if (json['pdfLinks'] != null) {
      json['pdfLinks'].forEach((v) {
        pdfLinksList.add(PdfLinksModel.fromJson(v));
      });
    }
    List<HtmlTagsModel> htmlTagsList = <HtmlTagsModel>[];
    if (json['htmlTags'] != null) {
      json['htmlTags'].forEach((v) {
        htmlTagsList.add(HtmlTagsModel.fromJson(v));
      });
    }
    return SimpleAppModel(title: json['title'], pdfLinks: pdfLinksList, htmlTags: htmlTagsList);
  }
}

class PdfLinksModel extends PdfLinks {
  PdfLinksModel({required super.title, required super.link});

  factory PdfLinksModel.fromJson(Map<String, dynamic> json) {
    return PdfLinksModel(title: json['title'], link: json['link']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = super.title;
    data['link'] = super.link;
    return data;
  }

}

class HtmlTagsModel extends HtmlTags {
  HtmlTagsModel({required super.title, required super.html});

  factory HtmlTagsModel.fromJson(Map<String, dynamic> json) {
    return HtmlTagsModel(title: json['title'] ?? "Default title", html: json['html']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = super.title;
    data['html'] = super.html;
    return data;
  }
}
