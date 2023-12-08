import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//primary swatch
const Map<int, Color> primaryColor = {
  50: Color.fromRGBO(229, 186, 115, 0.1),
  100: Color.fromRGBO(229, 186, 115, 0.2),
  200: Color.fromRGBO(229, 186, 115, 0.3),
  300: Color.fromRGBO(229, 186, 115, 0.4),
  400: Color.fromRGBO(229, 186, 115, 0.5),
  500: Color.fromRGBO(229, 186, 115, 0.6),
  600: Color.fromRGBO(229, 186, 115, 0.7),
  700: Color.fromRGBO(229, 186, 115, 0.8),
  800: Color.fromRGBO(229, 186, 115, 0.9),
  900: Color.fromRGBO(229, 186, 115, 1),
};

const colorBlue = Color(0xFF1E88E5);
const bluelightColor = Color(0xffE3EEFF);
const greenColor = Color(0xffE3F4E1);
const menuColorOld = Color(0xff1a237e);
const lightBlue = Color(0xffE3EEFF);
const menuColor = Color(0xff2563EB);
const greyCard = Color(0xffEEEEEE);
const fieldColor = Color(0xffE2E8F0);
const dropButtoncolor= Color(0xffCCCCCC);
const stopBtn = Color(0xFFE64A19);
const chartColor = Color(0xff1D5EA3);
const chartColor2 = Color(0xffB2CEEC);

// blue
const yellowPrimary = Color.fromRGBO(229, 186, 115, 1);
const yellowSecondary = Color.fromRGBO(247, 217, 142, 1);

const buttonColorPrimary = Color.fromRGBO(190, 150, 87, 1);
const buttonColorSecondary = Color.fromRGBO(247, 217, 142, 1);

const textFieldColor = Color.fromRGBO(34, 34, 50, 1);
const greyTextColor = Color.fromRGBO(121, 121, 121, 1);

const borderColor = Color.fromRGBO(34, 34, 50, 1);
const purpleColor = Color.fromRGBO(210, 181, 255, 1);

const blueDark = Color.fromRGBO(5, 92, 223, 1);
const blueLight = Color.fromRGBO(74, 145, 224, 1);

const pinkPrimary = Color.fromRGBO(176, 106, 179, 1);
const bluePrimary = Color.fromRGBO(69, 104, 220, 1);

const iconColor = Color.fromRGBO(186, 186, 186, 1);

const skyYellowPrimary = Color.fromRGBO(203, 227, 246, 1);
const skyBlueSecondary = Color.fromRGBO(243, 250, 254, 1);
const skyBlueDark = Color.fromRGBO(207, 232, 253, 1);
const skyBlueLight = Color.fromRGBO(239, 246, 252, 1);

const skyBlueBorder = Color.fromRGBO(188, 210, 233, 1);

const blackPrimary = Color.fromRGBO(7, 12, 24, 1);
const blackSecondary = Color.fromRGBO(5, 5, 5, 0.08);
const blackDark = Color.fromRGBO(5, 25, 23, 1);
const blackLight = Color.fromRGBO(65, 65, 88, 1);

const dividerColor = Color.fromRGBO(46, 47, 62, 1);

const greenPrimary = Color.fromRGBO(87, 193, 64, 1);
const greenSecondary = Color.fromRGBO(74, 216, 225, 1);
const greenProfile = Color.fromRGBO(74, 216, 225, 0.5);
const greenLight = Color.fromRGBO(39, 177, 164, 0.2);
const greenDark = Color.fromRGBO(74, 195, 139, 1);
const greenHigh = Color.fromRGBO(23, 112, 103, 1);

const greyPrimary = Color.fromRGBO(235, 241, 244, 1);
const greySecondary = Color.fromRGBO(172, 172, 172, 1);
const greyLight = Color.fromRGBO(209, 209, 209, 1);

const purplePrimary = Color.fromRGBO(99, 108, 234, 1);
const purpleSecondary = Color.fromRGBO(95, 83, 227, 1);

const whitePrimary = Color.fromRGBO(255, 255, 255, 1);
const whiteSecondary = Color.fromRGBO(233, 233, 233, 1);
const whiteLight = Color.fromRGBO(240, 247, 250, 1);
const slateBlue = Color.fromRGBO(100, 116, 139, 1.0);

const pinkLight = Color.fromRGBO(211, 208, 245, 1);

const redPrimary = Color.fromRGBO(243, 85, 85, 1);

const gradientDarkGreen = Color.fromRGBO(159, 219, 217, 1);
const gradientGreen = Color.fromRGBO(143, 222, 243, 1);
const gradientLightSkyBLue = Color.fromRGBO(191, 221, 253, 1);
const gradientSkyBlue = Color.fromRGBO(176, 210, 255, 1);
const backgroundColor = Color.fromRGBO(24, 25, 40, 1);

// statusBar
blueStatusBar() {
  return const SystemUiOverlayStyle(
    statusBarColor: backgroundColor,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: backgroundColor,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: backgroundColor,
  );
}

whiteStatusBar() {
  return const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: whitePrimary,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: whiteLight,
  );
}

// gradient

Gradient gradientBlue = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    yellowPrimary,
    greenSecondary,
  ],
);

Gradient gradientLightBlue = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    gradientDarkGreen,
    gradientGreen,
    gradientLightSkyBLue,
    gradientSkyBlue
  ],
);
