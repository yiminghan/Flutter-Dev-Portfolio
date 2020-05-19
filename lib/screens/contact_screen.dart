import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/data/app_data_provider.dart';
import 'package:flutter_dev_portfolio/utils/dimen_utils.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:flutter_dev_portfolio/widgets/footer.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Widget _contactMe() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      padding:
          EdgeInsets.symmetric(horizontal: getMainHorizontalPadding(context)),
      child: ListView(children: <Widget>[
        Divider(height: 32),
        Text(
          getData().contactMeHeaderText,
          style: getFont(28),
          textAlign: TextAlign.start,
        ),
        Divider(height: 32),
        Container(child: _myContactInfo()),
        Divider(height: 32),
      ]),
    );
  }

  Widget _myContactInfo() {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: getData()
          .contactMeTexts
          .map((item) => Text(item, style: getFont(28)))
          .toList(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Expanded(flex: 8, child: _contactMe()),
        Expanded(child: Footer())
      ],
    );
  }
}
