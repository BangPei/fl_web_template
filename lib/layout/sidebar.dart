import 'package:fl_web_template/constants/main_color.dart';
import 'package:fl_web_template/constants/main_size.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final double width;
  final String title;
  final Color? sideBarColor;
  final Color? headerColor;
  final Widget? logo;
  const SideBar({
    super.key,
    required this.width,
    this.sideBarColor,
    this.headerColor,
    this.logo,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: sideBarColor ?? MainColor.black,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 223, 223, 223),
            spreadRadius: 0.2,
            blurRadius: 7,
            offset: Offset(1, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Header(
            title: title,
            headerColor: headerColor,
            logo: logo,
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final Color? headerColor;
  final Widget? logo;
  final String title;
  const Header({super.key, this.headerColor, this.logo, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MainSize.navbar,
      decoration: BoxDecoration(
        color: headerColor,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            logo ??
                const FlutterLogo(
                  size: 40,
                ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title.toUpperCase(),
                style: const TextStyle(
                  color: MainColor.textWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
