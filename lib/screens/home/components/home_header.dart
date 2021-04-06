import 'package:flutter/material.dart';
import 'package:de_project/screens/cart/cart_screen.dart';
import 'file:///C:/Users/Bhavyang/AndroidStudioProjects/de_project/lib/screens/Scanner/scannerpage.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: 3,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/qrscan.svg",
            press: () => Navigator.pushNamed(context, ScannerPage.routeName),
          ),
        ],
      ),
    );
  }
}
