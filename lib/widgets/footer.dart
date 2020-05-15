import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  Widget _externalLinkButton(Widget icon, String url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        shape: CircleBorder(),
        child: icon,
        onPressed: () {
          launch(url);
        },
      ),
    );
  }

  Widget _externalLinks() {
    return Container(
        child: Row(
      children: <Widget>[
        _externalLinkButton(
            FaIcon(FontAwesomeIcons.github), "https://github.com/yiminghan"),
        _externalLinkButton(FaIcon(FontAwesomeIcons.linkedin),
            "https://www.linkedin.com/in/yiming-han-7340b4b1/"),
        _externalLinkButton(FaIcon(FontAwesomeIcons.instagram),
            "https://www.instagram.com/yimiihan/"),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: _externalLinks(),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text("@2020 Made with ❤️ and Flutter by YiMing Han",
                style: getFont(14)),
          ),
        )
      ],
    ));
  }
}
