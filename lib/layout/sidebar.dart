import 'package:fl_web_template/constants/main_color.dart';
import 'package:fl_web_template/constants/main_size.dart';
import 'package:fl_web_template/layout/responsive.dart';
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
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    double scale = Responsive.sidebarWidth > 150 ? 1 : 0;
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
                scaleText: scale,
              ),
              const SizedBox(height: 50),
              ListTile(
                onTap: () {},
                // horizontalTitleGap: 0.0,
                leading: Icon(
                  FontAwesomeIcons.gauge,
                  color: Colors.blue[400],
                  size: 22,
                ),
                title: Text(
                  "Dashboard",
                  textScaler: TextScaler.linear(scale),
                  style: const TextStyle(
                    fontSize: 13,
                    color: MainColor.textWhite,
                  ),
                ),
              ),
              ExpansionTile(
                onExpansionChanged: (expand) {
                  setState(() {
                    _expand = expand;
                  });
                },
                leading: Icon(
                  FontAwesomeIcons.itunes,
                  color: Colors.blue[400],
                  size: 22,
                ),
                // trailing: const Icon(Icons.expand_less,color: MainColor.textWhite,),
                trailing: Icon(
                  _expand ? Icons.arrow_drop_down : Icons.arrow_right,
                  color: MainColor.textWhite,
                ),
                title: Text(
                  "Product",
                  textScaler: TextScaler.linear(scale),
                  style: const TextStyle(
                    fontSize: 13,
                    color: MainColor.textWhite,
                  ),
                ),
                children: const [
                  ListTile(
                    title: Text("Management Product"),
                  ),
                  ListTile(
                    title: Text("Add Product"),
                  ),
                  ListTile(
                    title: Text("Category"),
                  ),
                  ListTile(
                    title: Text("Uom"),
                  ),
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
  final double? scaleText;
  const Header({
    super.key,
    this.headerColor,
    this.logo,
    required this.title,
    this.onTapLogo,
    this.scaleText,
  });

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
            Expanded(child: logo ?? const FlutterLogo()),
            Expanded(
              flex: 3,
              child: Text(
                title.toUpperCase(),
                textScaler: TextScaler.linear(scaleText ?? 1),
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
