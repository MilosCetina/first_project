import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../domain/entities/simple_app.dart';
import 'detail_page.dart';

class MainPage extends StatelessWidget {
  final List<SimpleApp> listOfItems;

  const MainPage({Key? key, required this.listOfItems}) : super(key: key);

  // void _ispisiDetalje(int i) {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ovo je main page"),
      ),
      body: Center(
        child: Expanded(
          child: ListView.builder(
            itemCount: listOfItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(listOfItems[index].title),
                subtitle: const Text("Click here to see pdf and htmls"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      htmlTags: listOfItems[index].htmlTags,
                      pdfLinks: listOfItems[index].pdfLinks,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
