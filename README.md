# Flutter Dev Portfolio  [![GitHub](https://img.shields.io/github/license/yiminghan/Flutter-Dev-Portfolio?color=blue)](https://github.com/yiminghan/Flutter-Dev-Portfolio/blob/master/LICENSE)

This is a simple developer portfolio website made with Flutter Web!

## Sections 
✔️ Landing Page\
✔️ About Me \
✔️ Work experience\
✔️ Projects Showcase\
✔️ Contact me\

Sample demo site: https://yiminghan.com

## Flutter Web Setup

Follow the official flutter site to setup flutter for web: 
https://flutter.dev/docs/get-started/web

## Getting Started

This project takes in app data from `data/app_data_provider.dart`.
Right now the provider is feeding my own personal data, but you can change the contents of `data/app_data.dart` to display your own.

What you will need to do:

1. Add a `assets/background.jpg` and `assets/resume_yiming.pdf` in pubspec.yaml.  For resume, you can choose a different resume name, but the `ResumeModel` you use later should reference the same name.
2. Fill up all the `FlutterDevPortfolioData` fields.  Copying `app_data.dart` and replacing your own data is good enough.
3. In `app_data_provider.dart`, make sure your new data is provided.
4. That's it!  Run flutter in Visual Studio Code and a chrome window should popup with your new site.

## Deployment

I use Google App Engine to host my [personal site](https://yiminghan.com). It costs about 3 cents a months and is practically free.

To host on gcloud, make sure you download all the command line tools first and have setup commandline authentication.  You will also need to set up a primary app to target your deployment.  It's a bit of work to setup, but afterwards it's very easy to update.

Once you have setup your gcloud commandline, simply run `deploy.sh` and you are good to go!

## Bugs and feature requests

Have a bug or a feature request? Please first read the issue guidelines and search for existing and closed issues. If your problem or idea is not addressed yet, [please open a new issue](https://github.com/yiminghan/Flutter-Dev-Portfolio/issues/new)

## Copyright and License 
Code released under the [MIT License](LICENSE).
