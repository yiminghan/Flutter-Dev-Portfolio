import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/screens/about_screen.dart';
import 'package:flutter_dev_portfolio/screens/contact_screen.dart';
import 'package:flutter_dev_portfolio/screens/home_screen.dart';
import 'package:flutter_dev_portfolio/screens/portfolio_screen.dart';
import 'package:flutter_dev_portfolio/screens/work_experience_screen.dart';
import 'package:flutter_dev_portfolio/utils/font_utils.dart';

class Screens extends StatefulWidget {
  Screens({Key key}) : super(key: key);

  @override
  _ScreensState createState() => _ScreensState();
}

enum SideMenu { Home, About, Work, Portfolio, Contact }

class _ScreensState extends State<Screens> with SingleTickerProviderStateMixin {
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
              backgroundColor: Colors.white.withOpacity(0.75),
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
                _customNavigationRailDestination("Work"),
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
      child: FloatingActionButton(
          key: ValueKey<bool>(_menuOpen),
          backgroundColor: Colors.transparent,
          elevation: _menuOpen ? 0 : 5,
          child: Icon(
            _menuOpen ? Icons.close : Icons.menu,
            color: _menuOpen ? Colors.black : Colors.white,
          ),
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
        label: Center(
            child:
                Text(text, style: getFont(18).copyWith(color: Colors.black))));
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

  Widget _getScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return AboutScreen();
        break;
      case 2:
        return WorkExperienceScreen();
      case 3:
        return PortfolioScreen();
        break;
      case 4:
        return ContactScreen();
        break;
      default:
        return HomeScreen();
    }
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildBackground(),
        _getScreen(),
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 120),
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
