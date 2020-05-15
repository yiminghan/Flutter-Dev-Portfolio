import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';
import 'package:flutter_dev_portfolio/utils/url_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key, this.size}) : super(key: key);

  final Size size;

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

enum SideMenu { Home, About, Portfolio, Contact }

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _menuOpen = false;

  AnimationController _sideMenuController;
  Animation<Offset> _sideMenuOffsetAnimation;

  @override
  void initState() {
    super.initState();
    _sideMenuController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _sideMenuOffsetAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0),
      end: const Offset(0, 0.0),
    ).animate(
        CurvedAnimation(curve: Curves.linear, parent: _sideMenuController));
  }

  @override
  void dispose() {
    _sideMenuController.dispose();
    super.dispose();
  }

  Widget _sideNavigationRail() {
    return Stack(
      children: <Widget>[
        SlideTransition(
            position: _sideMenuOffsetAnimation,
            child: NavigationRail(
              backgroundColor: Colors.white,
              groupAlignment: 0.0,
              minWidth: 56,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: [
                _customNavigationRailDestination("Home"),
                _customNavigationRailDestination("About"),
                _customNavigationRailDestination("Portfolio"),
                _customNavigationRailDestination("Contact"),
              ],
            )),
        _buildMenuButton(),
      ],
    );
  }

  Widget _buildMenuButton() {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInQuint,
      switchOutCurve: Curves.easeOutQuint,
      duration: Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          RotationTransition(child: child, turns: animation),
      child: IconButton(
          key: ValueKey<bool>(_menuOpen),
          icon: Icon(_menuOpen ? Icons.close : Icons.menu),
          onPressed: () {
            setState(() {
              if (!_menuOpen) {
                _sideMenuController.forward(from: 0);
              } else {
                _sideMenuController.reverse(from: 1);
              }
              _menuOpen = !_menuOpen;
            });
          }),
    );
  }

  NavigationRailDestination _customNavigationRailDestination(String text) {
    return NavigationRailDestination(
        icon: SizedBox.shrink(),
        label: Center(child: Text(text, style: getFont(25))));
  }

  Widget _topBar() {
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Text(
                "YiMing Han",
                style: getFont(50),
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
                        style: getFont(25))))
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
            child: Text("@2020 YiMing Han", style: getFont(14)),
          ),
        )
      ],
    ));
  }

  Widget _externalLink(Widget icon, String url) {
    return IconButton(
      icon: icon,
      onPressed: () {
        launchURL(url);
      },
    );
  }

  Widget _externalLinks() {
    return Container(
        child: Row(
      children: <Widget>[
        _externalLink(
            FaIcon(FontAwesomeIcons.githubAlt), "https://github.com/yiminghan"),
        _externalLink(FaIcon(FontAwesomeIcons.linkedin),
            "https://www.linkedin.com/in/yiming-han-7340b4b1/"),
        _externalLink(FaIcon(FontAwesomeIcons.instagram),
            "https://www.instagram.com/yimiihan/"),
      ],
    ));
  }

  Widget _buildBackground() {
    return Stack(
      children: <Widget>[
        Image(
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            image: AssetImage('assets/background.jpg'),
            frameBuilder: (BuildContext context, Widget child, int frame,
                bool wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                child: child,
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              );
            }),
        BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Container(color: Colors.transparent)),
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Expanded(child: _buildBackground()),
        Column(
          children: <Widget>[
            Expanded(child: _topBar()),
            Expanded(child: _aboutMe()),
            Expanded(child: _bottomRow())
          ],
        ),
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 150),
            child: _sideNavigationRail()),
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
