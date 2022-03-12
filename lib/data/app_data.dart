import 'package:flutter_dev_portfolio/models/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class FlutterDevPortfolioData {
  List<String> landingScreenTexts;
  AboutModel aboutMe;

  String workExperienceHeaderText;
  ResumeModel resume;
  List<WorkModel> workPositions;

  String portfolioHeaderText;
  List<PortfolioModel> projectPortfolio;

  String contactMeHeaderText;
  List<String> contactMeTexts;

  String footerText;
  List<ExternalLinkModel> footerIcons;
}

class YiMingPortfolioData extends FlutterDevPortfolioData {
  List<String> landingScreenTexts = [
    "YiMing Han. \nSoftware Developer.",
  ];

  static const String _aboutMeHeader = "Hey 👋 I'm YiMing Han";
  static const String _aboutMeSubHeader =
      "A Senior Mobile Developer from Toronto 🇨🇦";
  static const String _aboutMeText =
      "I'm a Problem Solver first, Developer second. To me, programming languages and frameworks are just tools to solve problems." +
          " I do not hesistate to learn new techonolgies neccessary to solve the Problem at hand.\n\n" +
          "I am currently 26, and I have been developing for almost 7 years." +
          " Even outside of my work I find myself building cool apps and contributing to open source projects." +
          " My current focus is on Mobile Develoment.\n\n" +
          "When I'm not writing code I spend time with Dota2, Kendo, and Photography.";

  AboutModel aboutMe = AboutModel(
      header: _aboutMeHeader,
      subHeader: _aboutMeSubHeader,
      bio: _aboutMeText,
      skills: [
        SkillModel(title: "Android Skills", tags: [
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
        ]),
        SkillModel(title: "General Skills", tags: [
          "Flutter",
          "React Native",
          "Windows UWP",
          "Jenkins",
          "Docker",
          "SQL",
          "Unity3D",
          "Google Cloud",
          "Microsoft Azure",
          "AWS",
          "WeChat Mini Program",
          "Alibaba Mini Program"
        ]),
        SkillModel(title: "My Most Comfortable Stack", tags: [
          "Kotlin ( + Coroutines)",
          "Refrofit",
          "Dagger",
          "Coil",
          "Moshi",
          "Room",
          "AndroidX",
          "Jetpack",
          "Firebase Auth",
          "Epoxy",
          "ViewBinding"
        ]),
        SkillModel(title: "Learning Right now", tags: [
          "Flutter",
          "WeChat Mini Program",
          "Alibaba Mini Program",
          "Universal Windows Platform"
        ])
      ]);

  String workExperienceHeaderText = "Places I have worked at";
  ResumeModel resume = ResumeModel(
      link: "http://yiminghan.com/assets/assets/resume_yiming.pdf",
      linkText: "Download Resume",
      defaultName: "YiMing_Resume.pdf");

  List<WorkModel> workPositions = [
    /// Modiface
    WorkModel(
        company: "Snap Inc.",
        position: "Senior Android Developer",
        bulletPoints: [
          "Working on the Bitmoji Stickers team.",
          "Leading the development of notable features, including Customoji in Snapchat Preview, Customoji on Bitmoji Keyboard, and Bitmoji Search Library.",
          "Features shipped to millions of users on Snapchat/Bitmoji App, resulting in increase in Bitmoji Sticker engagement by 10%+."
        ],
        from: "Feb 2021",
        to: "Present"),

    /// Modiface
    WorkModel(
        company: "Modiface",
        position: "Android Developer",
        bulletPoints: [
          "Modiface primarily focuses on Virtual Try On AR techonology to aid the beauty industry.",
          "I primarily build out features and demos for clients, while maintain the AR SDKs that we ship out.",
          "SDK platforms I maintain include Android, React Native, and Windows"
        ],
        from: "Jan 2020",
        to: "Jan 2021"),

    /// Nanoleaf
    WorkModel(
        company: "Nanoleaf",
        position: "Android Developer",
        bulletPoints: [
          "I lead the Development of the Nanoleaf Android App (100,000+ installs).",
          "I rewrote legacy codebase to Kotlin with MVI and Dynamic Feature Modules.",
          "Features include Dark Mode, ARCore, reactive UI with observables, and of course, network communication through local network."
        ],
        from: "Mar 2019",
        to: "Dec 2019"),

    /// FOOI
    WorkModel(
        company: "FOOI",
        position: "Android Developer",
        bulletPoints: [
          "I lead the Development of the FOOI Android App.",
          "Features include Braintree payment, firebase authentication, and biological security.",
        ],
        from: "Feb 2018",
        to: "Feb 2019"),

    /// Muma
    WorkModel(
      company: "Team Muma / UofT Innovation Lab",
      position: "Founder",
      bulletPoints: [
        "I worked with a team of five to develop a machine learning model that separate human voice from an audio input.",
        "I designed and built the backend structure for Muma, a service that identifies cover song music using machine learning model and allows music societies to capture more revenue.",
        "Automated and packaged services into Docker containers and hosted on Microsoft Azure.",
        "We participated and won the Canadian Runner-up for Microsoft Imagine Cup Canadian Finals 2018, and advanced as a Global Finalist."
      ],
      from: "Jan 2018",
      to: "Dec 2018",
    ),

    WorkModel(
      company: "Finastra",
      position: "DevOps Developer Co-op",
      bulletPoints: [
        "I worked closely with Dev team to implement cloud environments setup and deployment automation (including disaster recovery) for Barometer application.",
        "Automated and supported continuous software builds and deployments for 5+ projects during development phase, including Dev, QA, UAT and Production (Full, Patch builds).",
      ],
      from: "May 2016",
      to: "August 2017",
    )
  ];

  String portfolioHeaderText = "Stuff I made (and contributed to):";

  List<PortfolioModel> projectPortfolio = [
    /// HalfWay
    PortfolioModel(
        title: "HalfWay",
        workType: "Flutter Development",
        description: "Personal Flutter Project.",
        link:
            "https://play.google.com/store/apps/details?id=com.yiminghan.halfway",
        linkText: "View Play Store",
        logoAssetPath: "assets/halfway_logo.png"),

    /// Nanoleaf
    PortfolioModel(
        title: "Nanoleaf",
        workType: "Android Development",
        description: "I lead Android Development at Nanoleaf.",
        link:
            "https://play.google.com/store/apps/details?id=me.nanoleaf.nanoleaf",
        linkText: "View Play Store",
        logoAssetPath: "assets/nanoleaf_logo.png"),

    /// FOOI
    PortfolioModel(
        title: "FOOI",
        workType: "Android Development",
        description: "I lead Android Development at FOOI.",
        link: "https://play.google.com/store/apps/details?id=com.fooi",
        linkText: "View Play Store",
        logoAssetPath: "assets/fooi_logo.jpg"),

    /// Muma
    PortfolioModel(
        title: "Muma",
        workType: "ML / Backend Development",
        description:
            "Muma placed second place in Microsoft Imagine Cup 2018 Canadian Finals, advancing as a Global Finalist.",
        link:
            "https://imaginecup.microsoft.com/en-us/Team/eb66f6b4-5037-41bb-a940-f44ceba21aa8",
        linkText: "View Contest Page",
        logoAssetPath: "assets/muma_logo.png"),

    /// Muma
    PortfolioModel(
        title: "Penguin Rush",
        workType: "Unity3D Development",
        description:
            "Penguin Rush is a game made by University of Toronto and Centennial College students using the Unity Engine." +
                " This game is showcased at Level Up Showcase 2018.",
        link: "https://www.youtube.com/watch?v=o4CNXGsTZmU&t=",
        linkText: "View Game Trailer",
        logoAssetPath: "assets/penguin_rush_logo.png")
  ];

  String contactMeHeaderText = "Get In Touch";
  List<String> contactMeTexts = [
    "Email: hanyiming1995@gmail.com",
    "Phone: (1)-416-732-0702"
  ];

  String footerText = "@2022 Made with ❤️ and Flutter by YiMing Han";
  List<ExternalLinkModel> footerIcons = [
    ExternalLinkModel(
        iconData: FontAwesomeIcons.github,
        link: "https://github.com/yiminghan"),
    ExternalLinkModel(
        iconData: FontAwesomeIcons.linkedin,
        link: "https://www.linkedin.com/in/yiming-han-7340b4b1/"),
    ExternalLinkModel(
        iconData: FontAwesomeIcons.instagram,
        link: "https://www.instagram.com/yimiihan/"),
  ];
}
