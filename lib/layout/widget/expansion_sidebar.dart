import 'package:fl_web_template/constants/main_color.dart';
import 'package:fl_web_template/layout/responsive.dart';
import 'package:fl_web_template/layout/widget/list_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpansionSidebar extends StatefulWidget {
  final Function? onExpansionChanged;
  final bool initiallyExpanded;
  final Widget? leading;
  final String text;
  final List<ListSideBar> children;
  const ExpansionSidebar({
    super.key,
    this.onExpansionChanged,
    this.leading,
    required this.text,
    required this.children,
    this.initiallyExpanded = false,
  });

  @override
  State<ExpansionSidebar> createState() => _ExpansionSidebarState();
}

class _ExpansionSidebarState extends State<ExpansionSidebar> {
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    double scale = Responsive.sidebarWidth > 150 ? 1 : 0;
    return ExpansionTile(
      initiallyExpanded: widget.initiallyExpanded,
      onExpansionChanged: (expand) {
        setState(() {
          _expand = expand;
        });
        widget.onExpansionChanged ?? ();
      },
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      leading: widget.leading ??
          Icon(
            FontAwesomeIcons.itunes,
            color: Colors.blue[400],
            size: 22,
          ),
      trailing: Icon(
        _expand ? Icons.arrow_drop_down : Icons.arrow_right,
        color: MainColor.textWhite,
      ),
      title: Text(
        widget.text,
        textScaler: TextScaler.linear(scale),
        style: const TextStyle(
          fontSize: 13,
          color: MainColor.textWhite,
        ),
      ),
      children: widget.children,
    );
  }
}
