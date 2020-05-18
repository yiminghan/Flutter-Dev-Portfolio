import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/data/app_data_provider.dart';
import 'package:flutter_dev_portfolio/models/models.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:flutter_dev_portfolio/utils/url_utils.dart';
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
      child: ListView(children: <Widget>[
        Divider(height: 32),
        Text(
          getData().portfolioHeaderText,
          style: getFont(25),
          textAlign: TextAlign.start,
        ),
        Divider(height: 32),
        Container(child: _portfolioEntries()),
        Divider(height: 32),
      ]),
    );
  }

  Widget _portfolioEntries() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Scrollbar(
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: getData()
                .projectPortfolio
                .map((item) => _buildPortfolioCard(item))
                .toList()),
      ),
    );
  }

  Widget _buildPortfolioCard(PortfolioModel item) {
    return Container(
      margin: EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          color: Colors.white.withOpacity(0.2),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (item.logoAssetPath != null)
                  AspectRatio(
                    aspectRatio: 3 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage(item.logoAssetPath),
                      ),
                    ),
                  ),
                //TODO: use selectable text once we can copy
                FittedBox(
                  child: Text(
                    item.title,
                    style: getFont(28),
                    textAlign: TextAlign.center,
                  ),
                ),
                FittedBox(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    item.workType,
                    style: getFont(28),
                    textAlign: TextAlign.center,
                  ),
                )),
                FittedBox(
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        color: Colors.white,
                      ),
                      child: Text(
                        item.linkText,
                        style: getFont(14).copyWith(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    onTap: () => {launchURL(item.link)},
                  ),
                )
              ],
            ),
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
