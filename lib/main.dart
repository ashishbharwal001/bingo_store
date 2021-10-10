import 'dart:ui';
import 'package:bingo_shop/screens/orders.dart';
import 'package:bingo_shop/utils/bottomnavbar/constants.dart';
import 'package:bingo_shop/utils/bottomnavbar/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/bottomnavbar/indexed.dart';
import 'package:heroicons/heroicons.dart';
import 'package:flutter/services.dart';

void main() {
  // not allowing to Landscape Mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

double scaledHeight(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.height / 800);
}

double scaledWidth(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.width / 375);
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController _pageController;
  int activeIndex = 1;
  List<bool> hideNavBar = <bool>[
    false,
    true,
    false,
    false,
    false,
  ];

  var iconData = <HeroIcons>[
    HeroIcons.home,
    HeroIcons.shoppingBag,
    HeroIcons.clipboardCheck,
    HeroIcons.menuAlt3,
    HeroIcons.user,
  ];

  var badges = <int>[0, 8, 0, 0, 0];

  var iconText = <String>[
    'Home',
    'Orders',
    'Products',
    'Manage',
    'Accounts',
  ];

  var indicatorColors = <Color>[
    Constants.AppPrimaryColor,
    Constants.AppPrimaryColor,
    Constants.AppPrimaryColor,
    Constants.AppPrimaryColor,
    Constants.AppPrimaryColor,
  ];

  List<Widget?> get badgeWidgets => indexed(badges)
      .map((Indexed indexed) => indexed.value > 0
          ? Text(indexed.value.toString(),
              style: TextStyle(
                color: Colors.white,
              ))
          : null)
      .toList();

  void incrementIndex() {
    setState(() {
      activeIndex = activeIndex < (iconData.length - 1) ? activeIndex + 1 : 0;
    });
  }

  _onAnimate(AnimationUpdate update) {}

  _onTap(int index) {
    if (activeIndex == index) {
      _incrementBadge();
    }
    activeIndex = index;

    setState(() {
      _pageController.animateToPage(activeIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  void _incrementBadge() {
    setState(() {
      // badges[activeIndex] += 1;
      badges[1] += 1;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: activeIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customMaterialAppColor,
        primaryColor: Constants.AppPrimaryColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
            primary: Constants.AppPrimaryColor,
            secondary: Constants.AppPrimaryColor,
            primaryVariant: Constants.AppPrimaryColor),
        appBarTheme: AppBarTheme(centerTitle: true),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Builder(
        builder: (BuildContext context) {
          // double largeIconHeight = MediaQuery.of(context).size.width;
          double navBarHeight = scaledHeight(context, 85);

          return Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   backgroundColor: Constants.AppPrimaryColor,
            //   child: Icon(Icons.add),
            //   onPressed: _incrementBadge,
            // ),
            appBar: hideNavBar[activeIndex]
                ? PreferredSize(
                    child: Container(),
                    preferredSize: Size.fromHeight(0),
                  )
                : AppBar(
                    title: Text(' Tab ${activeIndex + 1}'),
                  ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                Container(
                  child: Center(child: Text("Home Page")),
                ),
                OrderScreen(),
                Container(
                  child: Center(child: Text("Products Page")),
                ),
                Container(
                  child: Center(child: Text("Manage")),
                ),
                Container(
                  child: Center(child: Text("Accounts")),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              height: navBarHeight,
              width: MediaQuery.of(context).size.width,
              color: Constants.whiteColor,
              // Option 1: Recommended
              child: CustomNavBar.iconData(
                activeBadgeColors: <Color>[
                  Constants.ApplightOrange,
                ],
                activeIndex: activeIndex,
                animationCurve: Curves.bounceInOut,
                animationType: AnimationType.shrinkOutIn,
                baseAnimationSpeed: 150,
                badges: badgeWidgets,
                iconData: iconData,
                iconColors: <Color>[Colors.grey[400]!],
                selectedIconTextColor: Constants.AppPrimaryColor,
                unSelectedIconTextColor: Constants.greyColor,
                iconTexts: iconText,
                indicatorColors: indicatorColors,
                iconSize: 22,
                indicatorRadius: scaledHeight(context, 30),
                onAnimate: _onAnimate,
                onTap: _onTap,
              ),
            ),
          );
        },
      ),
    );
  }
}
