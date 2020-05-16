import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:flutter_dev_portfolio/widgets/footer.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String aboutMe = "Hey 👋 I'm YiMing Han";
  String aboutMeSubHeader = "A Senior Mobile Developer from Toronto 🇨🇦";
  String aboutMeText =
      "I'm a Problem Solver first, Developer second. To me, programming languages and frameworks are just tools to solve problems." +
          " I do not hesistate to learn new techonolgies neccessary to solve the Problem at hand.\n\n" +
          "I am currently 24, and I have been developing for almost 5 years." +
          " Even outside of my work I find myself building cool apps and contributing to open source projects." +
          " My current focus is on Mobile Develoment.\n\n" +
          "When I'm not writing code I spend time with Dota2, Kendo, and Photography.";

  List<String> androidSkills = [
    "Kotlin",
    "Kotlin Corotines",
    "Java",
    "C/C++ (OpenGL ES)",
    "AndroidX",
    "Android Jetpack",
    "Jetpack Compose",
    "Firebase",
    "Realm / Room",
    "Retrofit",
    "Dagger",
    "Mockito",
    "Espresso",
    "ARCore",
  ];

  Widget _skills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Skills",
          style: getFont(32),
          textAlign: TextAlign.start,
        ),
        Wrap(
            children:
                androidSkills.map((item) => _buildSkillChip(item)).toList()),
      ],
    );
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
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.25)),
        padding: EdgeInsets.symmetric(horizontal: 150, vertical: 50),
        child: Scrollbar(
          child: ListView(children: <Widget>[
            Container(
              child: Text(
                aboutMe,
                style: getFont(32),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              child: Text(
                aboutMeSubHeader,
                style: getFont(25),
                textAlign: TextAlign.start,
              ),
            ),
            Divider(height: 32),
            Container(
                child: Text(
              aboutMeText,
              style: getFont(18),
              textAlign: TextAlign.start,
            )),
            Divider(height: 32),
            _skills(),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Expanded(flex: 6, child: _aboutMe()),
        Expanded(child: Footer())
      ],
    );
  }
}
