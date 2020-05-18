import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/data/app_data_provider.dart';
import 'package:flutter_dev_portfolio/models/models.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:flutter_dev_portfolio/widgets/footer.dart';

class WorkExperienceScreen extends StatefulWidget {
  WorkExperienceScreen({Key key}) : super(key: key);

  @override
  _WorkExperienceScreenState createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
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

  void serveResume() {
    html.window.open(getData().resume.link, getData().resume.defaultName);
  }

  Widget _workExperience() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        padding: EdgeInsets.symmetric(horizontal: 150),
        child: Scrollbar(
          child: ListView(children: <Widget>[
            Divider(height: 32),
            Container(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    getData().workExperienceHeaderText,
                    style: getFont(25),
                    textAlign: TextAlign.start,
                  ),
                  ActionChip(
                    label: Text(
                      getData().resume.linkText,
                      style: getFont(25).copyWith(color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    avatar: Icon(Icons.file_download),
                    onPressed: serveResume,
                  ),
                ],
              ),
            ),
            Divider(height: 32),
            _workPositions(),
            Divider(height: 32),
          ]),
        ));
  }

  Widget _workPositions() {
    return Column(
        children: getData()
            .workPositions
            .map((item) => _buildWorkCard(item))
            .toList());
  }

  Widget _buildWorkCard(WorkModel item) {
    return Container(
      padding: EdgeInsets.only(top: 32),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  item.company,
                  style: getFont(28),
                  textAlign: TextAlign.start,
                ),
                if (item.from != null && item.to != null)
                  Text(
                    "${item.from} - ${item.to}",
                    style: getFont(28),
                    textAlign: TextAlign.center,
                  )
              ],
            ),
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
