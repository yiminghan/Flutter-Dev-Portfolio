import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/data/app_data.dart';
import 'package:flutter_dev_portfolio/models/models.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:flutter_dev_portfolio/widgets/footer.dart';

class PortfolioScreen extends StatefulWidget {
  PortfolioScreen({Key key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  Widget _portfolio() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        padding: EdgeInsets.symmetric(horizontal: 150),
        child: Scrollbar(
          child: ListView(children: <Widget>[
            Divider(height: 32),
            Text(
              "Stuff I made (and contributed to):",
              style: getFont(25),
              textAlign: TextAlign.start,
            ),
            Divider(height: 32),
            _portfolioEntries(),
            Divider(height: 32),
          ]),
        ));
  }

  Widget _portfolioEntries() {
    return GridView.count(
        childAspectRatio: 1,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        children:
            projectPortfolio.map((item) => _buildPortfolioCard(item)).toList());
  }

  Widget _buildPortfolioCard(PortfolioModel item) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: Colors.white.withOpacity(0.2),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/nanoleaf_logo.png'),
                    ),
                  ),
                ),
              ),
              //TODO: use selectable text once we can copy
              Text(
                item.title,
                style: getFont(28),
                textAlign: TextAlign.center,
              ),
              Text(
                item.description,
                style: getFont(22),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Expanded(flex: 8, child: _portfolio()),
        Expanded(child: Footer())
      ],
    );
  }
}
