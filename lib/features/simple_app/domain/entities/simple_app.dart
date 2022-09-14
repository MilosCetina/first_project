import 'package:equatable/equatable.dart';

class SimpleAppList extends Equatable{
  final List<SimpleApp> simpleAppList;

  const SimpleAppList(this.simpleAppList);

  @override
  List<Object> get props => [simpleAppList];
}

class SimpleApp extends Equatable{
  String title;
  List<PdfLinks> pdfLinks;
  List<HtmlTags> htmlTags;

  SimpleApp({required this.title, required this.pdfLinks, required this.htmlTags});

  @override
  List<Object?> get props => [title, pdfLinks, htmlTags];
}

class PdfLinks{
  String title;
  String link;

  PdfLinks({required this.title, required this.link});
}

class HtmlTags{
  String title;
  String html;

  HtmlTags({required this.title, required this.html});
}