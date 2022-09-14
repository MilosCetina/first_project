import 'package:first_project/features/simple_app/presentation/pages/document_display_page.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/simple_app.dart';

class DetailPage extends StatelessWidget {
  final List<PdfLinks> pdfLinks;
  final List<HtmlTags> htmlTags;

  const DetailPage({Key? key, required this.pdfLinks, required this.htmlTags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ovo je detail page"),
      ),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              itemCount: pdfLinks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(pdfLinks[index].title),
                  subtitle: const Text("Click here to see pdf and htmls"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentDisplayPage(),
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: htmlTags.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(htmlTags[index].title),
                  subtitle: const Text("Click here to see pdf and htmls"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentDisplayPage(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
