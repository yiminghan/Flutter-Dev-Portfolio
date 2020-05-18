import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/data/app_data_provider.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:flutter_dev_portfolio/widgets/footer.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Widget _skills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getData()
          .aboutMe
          .skills
          .map((item) => _buildSkillSection(item.title, item.tags))
          .toList(),
    );
  }

  Widget _buildSkillSection(String title, List<String> tags) {
    return Column(children: <Widget>[
      Divider(
        height: 32,
      ),
      Text(
        title,
        style: getFont(32),
        textAlign: TextAlign.start,
      ),
      Wrap(
          alignment: WrapAlignment.center,
          children: tags.map((item) => _buildSkillChip(item)).toList()),
    ]);
  }

  Widget _buildSkillChip(String item) {
    return Container(
        padding: EdgeInsets.all(2),
        child: new Chip(
            elevation: 0,
            visualDensity: VisualDensity.compact,
            backgroundColor: Colors.white.withOpacity(0.5),
            label:
                Text(item, style: getFont(20).copyWith(color: Colors.black))));
  }

  Widget _aboutMe() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        padding: EdgeInsets.symmetric(horizontal: 150),
        child: Scrollbar(
          child: ListView(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 32),
              child: Text(
                getData().aboutMe.header,
                style: getFont(32),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              child: Text(
                getData().aboutMe.subHeader,
                style: getFont(25),
                textAlign: TextAlign.start,
              ),
            ),
            Divider(height: 32),
            Container(
                child: Text(
              getData().aboutMe.bio,
              style: getFont(18),
              textAlign: TextAlign.start,
            )),
            Divider(height: 32),
            _skills(),
            Divider(height: 32),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Expanded(flex: 8, child: _aboutMe()),
        Expanded(child: Footer())
      ],
    );
  }
}
