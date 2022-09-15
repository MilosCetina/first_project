import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../domain/entities/simple_app.dart';
import 'detail_page.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/main-page";
  late List<SimpleApp> listOfItems;

  MainPage({Key? key}) : super(key: key);

  // void _ispisiDetalje(int i) {
  //
  // }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as List<SimpleApp>;
    listOfItems = routeArgs;
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
                onTap: () => Navigator.of(context).pushNamed(
                  DetailPage.routeName,
                  arguments: {
                    'pdf': listOfItems[index].pdfLinks,
                    'html': listOfItems[index].htmlTags,
                  },
                ),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => DetailPage(
                //       htmlTags: listOfItems[index].htmlTags,
                //       pdfLinks: listOfItems[index].pdfLinks,
                //     ),
                //   ),
                // ),
              );
            },
          ),
        ),
      ),
    );
  }
}
