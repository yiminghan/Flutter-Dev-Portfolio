class AboutModel {
  AboutModel({this.header, this.subHeader, this.bio, this.skills});

  final String header;
  final String subHeader;
  final String bio;
  final List<SkillModel> skills;
}

class SkillModel {
  SkillModel({this.title, this.tags});

  final String title;
  final List<String> tags;
}

class WorkModel {
  WorkModel(
      {this.company, this.position, this.bulletPoints, this.from, this.to});

  final String company;
  final String position;
  final List<String> bulletPoints;
  final String from;
  final String to;
}

class PortfolioModel {
  PortfolioModel(
      {this.title, this.description, this.workType, this.linkText, this.link});

  final String title;
  final String description;
  final String workType;
  final String linkText;
  final String link;
}
