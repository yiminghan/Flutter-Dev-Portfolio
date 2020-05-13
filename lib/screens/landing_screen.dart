import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/utils/url_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

enum SideMenu { Home, About, Portfolio, Contact }

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;
  bool _menuOpen = false;

  Widget _sideNavigationRail() {
    //TODO: use SlideTransition Instead
    return AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(
              child: child,
              scale: animation,
            ),
        duration: Duration(milliseconds: 200),
        child: _menuOpen
            ? NavigationRail(
                groupAlignment: 0.0,
                minWidth: 40,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                leading: _buildMenuButton(),
                labelType: NavigationRailLabelType.all,
                destinations: [
                  _customNavigationRailDestination("Home"),
                  _customNavigationRailDestination("About"),
                  _customNavigationRailDestination("Portfolio"),
                  _customNavigationRailDestination("Contact"),
                ],
              )
            : _buildMenuButton());
  }

  Widget _buildMenuButton() {
    return IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          setState(() {
            _menuOpen = !_menuOpen;
          });
        });
  }

  NavigationRailDestination _customNavigationRailDestination(String text) {
    return NavigationRailDestination(
        icon: SizedBox.shrink(),
        label: Center(
          child: Text(text,
              style:
                  GoogleFonts.indieFlower(textStyle: TextStyle(fontSize: 25))),
        ));
  }

  Widget _topBar() {
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Text(
                "YiMing Han",
                style:
                    GoogleFonts.indieFlower(textStyle: TextStyle(fontSize: 50)),
                textAlign: TextAlign.start,
              ))),
    ]));
  }

  Widget _aboutMe() {
    return Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Align(
                    alignment: Alignment(-0.8, 0),
                    child: Text(
                      "As a senior mobile engineer\nI create amazing websites and mobile apps",
                      style: GoogleFonts.indieFlower(
                          textStyle: TextStyle(fontSize: 25)),
                    )))
          ],
        ));
  }

  Widget _bottomRow() {
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
            child: Text(
              "@2020 YiMing Han",
              style:
                  GoogleFonts.indieFlower(textStyle: TextStyle(fontSize: 14)),
            ),
          ),
        )
      ],
    ));
  }

  Widget _externalLinks() {
    return Container(
        child: Row(
      children: <Widget>[
        IconButton(
          icon: FaIcon(FontAwesomeIcons.github),
          onPressed: () {
            launchURL("https://github.com/yiminghan");
          },
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.linkedinIn),
          onPressed: () {
            launchURL("https://www.linkedin.com/in/yiming-han-7340b4b1/");
          },
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.instagram),
          onPressed: () {
            launchURL("https://www.instagram.com/yimiihan/");
          },
        )
      ],
    ));
  }

  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _sideNavigationRail(),
        Expanded(
            child: Column(
          children: <Widget>[
            Expanded(child: _topBar()),
            Expanded(child: _aboutMe()),
            Expanded(child: _bottomRow())
          ],
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}
