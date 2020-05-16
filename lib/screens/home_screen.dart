import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:flutter_dev_portfolio/widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _landingLabel() {
    return Container(
        padding: EdgeInsets.all(24),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Align(
                      alignment: Alignment(-0.7, 1),
                      child: TypewriterAnimatedTextKit(
                          onTap: () {},
                          //TODO: use repeat forever once PR is merged
                          totalRepeatCount: 9999,
                          speed: Duration(milliseconds: 100),
                          text: [
                            "YiMing Han.",
                            "Software Developer.",
                            "Casual Photographer.",
                            "Kendo Player.",
                          ],
                          textStyle: getFont(25),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart)))
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: _landingLabel()),
        Expanded(child: Footer())
      ],
    );
  }
}
