import 'package:fl_web_template/constants/main_color.dart';
import 'package:fl_web_template/layout/responsive.dart';
import 'package:flutter/material.dart';

class ListSideBar extends StatelessWidget {
  final String text;
  final Icon? icon;
  final double? scale;
  const ListSideBar({
    super.key,
    required this.text,
    this.icon,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    double scale_ = scale ?? (Responsive.sidebarWidth > 150 ? 1 : 0);
    return ListTile(
      onTap: () {},
      dense: true,
      leading: icon ?? const SizedBox.shrink(),
      title: Text(
        text,
        textScaler: TextScaler.linear(scale_),
        style: const TextStyle(
          fontSize: 13,
          color: MainColor.textWhite,
        ),
      ),
    );
  }
}
