import 'package:fl_web_template/constants/main_color.dart';
import 'package:fl_web_template/constants/main_size.dart';
import 'package:fl_web_template/layout/responsive.dart';
import 'package:fl_web_template/layout/widget/expansion_sidebar.dart';
import 'package:fl_web_template/layout/widget/list_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideBar extends StatefulWidget {
  final String title;
  final Color? backgroundColor;
  final Color? headerColor;
  final Widget? logo;

  final GestureTapCallback? onTapLogo;
  const SideBar({
    super.key,
    this.backgroundColor = MainColor.black,
    this.headerColor,
    this.logo,
    required this.title,
    this.onTapLogo,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: Responsive.sidebarWidth,
      height: double.infinity,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 223, 223, 223),
            spreadRadius: 0.2,
            blurRadius: 7,
            offset: Offset(1, 0),
          ),
        ],
      ),
      child: Visibility(
        visible: Responsive.sidebarWidth == 250,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                title: widget.title,
                headerColor: widget.headerColor,
                logo: widget.logo,
                onTapLogo: widget.onTapLogo,
              ),
              const SizedBox(height: 50),
              ListSideBar(
                text: 'Dashboard',
                icon: Icon(
                  FontAwesomeIcons.gauge,
                  color: Colors.blue[400],
                  size: 22,
                ),
              ),
              const ExpansionSidebar(
                text: 'Product',
                children: [
                  ListSideBar(text: 'Management Product'),
                  ListSideBar(text: 'Add Product'),
                  ListSideBar(text: 'Categrory'),
                  ListSideBar(text: 'UOM'),
                  ListSideBar(text: 'Brand'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final Color? headerColor;
  final Widget? logo;
  final String title;
  final GestureTapCallback? onTapLogo;
  const Header({
    super.key,
    this.headerColor,
    this.logo,
    required this.title,
    this.onTapLogo,
  });

  @override
  Widget build(BuildContext context) {
    double scale = Responsive.sidebarWidth > 150 ? 1 : 0;
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
            Expanded(child: logo ?? const FlutterLogo()),
            Expanded(
              flex: 3,
              child: Text(
                title.toUpperCase(),
                textScaler: TextScaler.linear(scale),
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
