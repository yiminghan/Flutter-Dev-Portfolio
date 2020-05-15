import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/screens/landing_screen.dart';

class FlutterDevPortfolio extends StatelessWidget {
  const FlutterDevPortfolio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LayoutBuilder(
              builder: (context, constraints) {
                return Screens();
              },
            )
      },
    );
  }
}
