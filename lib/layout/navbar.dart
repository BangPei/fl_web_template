import 'package:fl_web_template/constants/main_color.dart';
import 'package:fl_web_template/constants/main_size.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final VoidCallback? onMenuClick;
  const Navbar({super.key, this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 223, 223, 223),
              spreadRadius: 0.2,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
        ),
        height: MainSize.navbar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onMenuClick,
              icon: const Icon(
                Icons.menu,
                color: MainColor.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
