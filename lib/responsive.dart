import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopScreen;
  final Widget mediumScreen;
  final Widget mobileScreen;

  const ResponsiveWidget({
    Key key,
    this.desktopScreen,
    this.mobileScreen,
    this.mediumScreen,
  }) : super(key: key);

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return desktopScreen;
      } else if (constraints.maxWidth <= 1200 && constraints.maxWidth >= 800) {
        return mediumScreen ?? desktopScreen;
      } else {
        return mobileScreen ?? desktopScreen;
      }
    });
  }
}
