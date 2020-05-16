import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/models/models.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:flutter_dev_portfolio/widgets/footer.dart';

class WorkExperienceScreen extends StatefulWidget {
  WorkExperienceScreen({Key key}) : super(key: key);

  @override
  _WorkExperienceScreenState createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  List<WorkModel> workPositions = [
    WorkModel(
        company: "Modiface",
        position: "Android Developer",
        bulletPoints: [
          "Modiface primarily focuses on AR techonology to aid the beauty industry. My primary work includes working to build out features for clients, maintaining the Android SDKs that we ship out."
        ],
        from: "Jan 2020",
        to: "Present")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Expanded(flex: 8, child: _workExperience()),
        Expanded(child: Footer())
      ],
    );
  }

  Widget _workExperience() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.25)),
        padding: EdgeInsets.symmetric(horizontal: 150, vertical: 50),
        child: Scrollbar(
          child: ListView(children: <Widget>[
            Container(
              child: Text(
                "Places I have worked at",
                style: getFont(25),
                textAlign: TextAlign.start,
              ),
            ),
            Divider(height: 32),
            _workPositions(),
          ]),
        ));
  }

  Widget _workPositions() {
    return Column(
        children: workPositions.map((item) => _buildWorkCard(item)).toList());
  }

  Widget _buildWorkCard(WorkModel item) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                item.company,
                style: getFont(28),
                textAlign: TextAlign.start,
              ),
              Text(
                "${item.from} - ${item.to}",
                style: getFont(28),
                textAlign: TextAlign.end,
              )
            ],
          ),
          Text(
            item.position,
            style: getFont(22),
            textAlign: TextAlign.start,
          ),
          for (String point in item.bulletPoints)
            Text(
              point,
              style: getFont(18),
              textAlign: TextAlign.start,
            ),
        ],
      ),
    );
  }
}
