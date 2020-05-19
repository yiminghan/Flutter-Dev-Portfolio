import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/data/app_data_provider.dart';
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: getData()
          .footerIcons
          .map((item) => _externalLinkButton(FaIcon(item.iconData), item.link))
          .toList(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(getData().footerText, style: getFont(14)),
          ),
        ),
        Expanded(
            child: Align(
          alignment: AlignmentDirectional.bottomStart,
          child: _externalLinks(),
        )),
      ],
    ));
  }
}
