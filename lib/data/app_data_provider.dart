import 'package:flutter_dev_portfolio/data/app_data.dart';

class AppDataProvider {
  static FlutterDevPortfolioData getData() {
    return YiMingPortfolioData();
  }
}

FlutterDevPortfolioData getData() {
  return AppDataProvider.getData();
}
