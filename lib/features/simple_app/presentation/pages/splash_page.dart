import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network("https://www.icbtech.rs/wp-content/uploads/2021/11/512-300x300.png"),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
