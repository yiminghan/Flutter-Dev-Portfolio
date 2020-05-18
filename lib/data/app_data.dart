import 'dart:io';

import 'package:flutter_dev_portfolio/models/models.dart';

String _aboutMeHeader = "Hey 👋 I'm YiMing Han";
String _aboutMeSubHeader = "A Senior Mobile Developer from Toronto 🇨🇦";
String _aboutMeText =
    "I'm a Problem Solver first, Developer second. To me, programming languages and frameworks are just tools to solve problems." +
        " I do not hesistate to learn new techonolgies neccessary to solve the Problem at hand.\n\n" +
        "I am currently 24, and I have been developing for almost 5 years." +
        " Even outside of my work I find myself building cool apps and contributing to open source projects." +
        " My current focus is on Mobile Develoment.\n\n" +
        "When I'm not writing code I spend time with Dota2, Kendo, and Photography.";

SkillModel _androidSkills = SkillModel(title: "Android Skills", tags: [
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
]);

SkillModel _generalDevSkills = SkillModel(title: "General Skills", tags: [
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
]);

SkillModel _perferredStack =
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
]);

SkillModel _learningRightNow = SkillModel(title: "Learning Right now", tags: [
  "Flutter",
  "WeChat Mini Program",
  "Alibaba Mini Program",
  "Universal Windows Platform"
]);

AboutModel aboutMe = AboutModel(
    header: _aboutMeHeader,
    subHeader: _aboutMeSubHeader,
    bio: _aboutMeText,
    skills: [
      _androidSkills,
      _generalDevSkills,
      _perferredStack,
      _learningRightNow
    ]);

List<WorkModel> workPositions = [
  /// Modiface
  WorkModel(
      company: "Modiface",
      position: "Android Developer",
      bulletPoints: [
        "Modiface primarily focuses on AR techonology to aid the beauty industry." +
            " My primary work includes working to build out features for clients, maintaining the Android SDKs that we ship out."
      ],
      from: "Jan 2020",
      to: "Present"),

  /// Nanoleaf
  WorkModel(
      company: "Nanoleaf",
      position: "Android Developer",
      bulletPoints: [
        "I lead the Development of the Nanoleaf Android App.",
        "Worked closely with the Dev team to develop the Android app for Nanoleaf (100,000+ installs). Rewriting legacy codebase to Kotlin with MVVM and redesigning the whole app architecture structure with Dynamic Feature Modules."
            "Iterated closely with design team to constantly improve UI/UX using tools such as inVision, while keeping design modular and expandable using Material guidelines. Features include Dark Mode, AR, reactive UI with observables, etc."
      ],
      from: "Mar 2019",
      to: "Dec 2019"),

  /// FOOI
  WorkModel(
      company: "FOOI",
      position: "Android Developer",
      bulletPoints: [
        "I lead the Development of the FOOI Android App.",
        "Worked closely with entire team to iterate on designs and key components of the app.",
        "Trained another co-op student and worked with him side-by-side to provide mentorship and support."
      ],
      from: "Feb 2018",
      to: "Feb 2019"),

  /// Muma
  WorkModel(
    company: "Team Muma / UofT Innovation Lab",
    position: "Founder",
    bulletPoints: [
      "Worked with a team of 5 to develop a machine learning model that separate human voice from an audio input.",
      "Designed and built the backend structure for Muma, a service that identifies cover song music using machine learning model and allows music societies to capture more revenue.",
      "Automated and packaged services into Docker containers and hosted on Microsoft Azure.",
      "Participated and won the Canadian Runner-up for Microsoft Imagine Cup Canadian Finals 2018, and advanced as a Global Finalist."
    ],
    from: "Jan 2018",
    to: "Dec 2018",
  ),

  WorkModel(
    company: "Finastra",
    position: "DevOps Developer Co-op",
    bulletPoints: [
      "Worked closely with Dev team to implement cloud environments setup and deployment automation (including disaster recovery) for Barometer application independently.",
      "Automated and supported continuous software builds and deployments for 5+ projects during development phase, including Dev, QA, UAT and Production (Full, Patch builds).",
      "Documented all procedures related to the processes and tools developed and hosted knowledge transfer sessions to enable more productivity from new team members.",
      "Conducted and implemented build scripts design sessions and code reviews/walkthroughs.",
      "Interviewed, recruited, and trained two new co-op students to replace my position."
    ],
    from: "May 2016",
    to: "August 2017",
  )
];

List<PortfolioModel> projectPortfolio = [
  //Nanoleaf
  PortfolioModel(
      title: "Nanoleaf",
      description:
          "At Nanoleaf, we create smart home products that take ordinary experiences and make them extraordinary." +
              " We do this by rethinking what is possible, and creating products that can help to improve the way we experience our everyday lives." +
              " I lead Android Development at Nanoleaf.",
      link: "https://nanoleaf.me",
      linkText: "View Products"),
  //Nanoleaf
  PortfolioModel(
      title: "Nanoleaf",
      description: "I lead Android Development at Nanoleaf.",
      link: "https://nanoleaf.me",
      linkText: "View Products",
      logoAssetPath: "assets/nanoleaf_logo.png")
];