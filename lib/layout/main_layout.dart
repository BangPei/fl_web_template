import 'package:fl_web_template/layout/navbar.dart';
import 'package:fl_web_template/layout/responsive.dart';
import 'package:fl_web_template/layout/sidebar.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    Responsive.sidebarWithControll(size);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Visibility(
              visible: Responsive.sidebarOpen,
              child: AnimatedContainer(
                width: Responsive.sidebarWidth,
                duration: const Duration(milliseconds: 200),
                child: SideBar(
                  title: "SSMart10",
                  width: Responsive.sidebarWidth,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Navbar(onMenuClick: () {
                      setState(() {
                        Responsive.sidebarClick(size);
                      });
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
