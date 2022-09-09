import 'package:equatable/equatable.dart';

class SimpleApp extends Equatable{
  String? title;
  List<PdfLinks>? pdfLinks;
  List<HtmlTags>? htmlTags;

  SimpleApp({this.title, this.pdfLinks, this.htmlTags});

  @override
  List<Object?> get props => [title, pdfLinks, htmlTags];
}

class PdfLinks{
  String? title;
  String? link;

  PdfLinks({this.title, this.link});
}

class HtmlTags{
  String? title;
  String? html;

  HtmlTags({this.title, this.html});
}