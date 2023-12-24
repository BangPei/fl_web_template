import 'package:fl_web_template/constants/main_color.dart';
import 'package:fl_web_template/constants/main_size.dart';
import 'package:fl_web_template/layout/responsive.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final VoidCallback? onMenuClick;
  final String username;
  final Widget? avatar;
  final Widget? child;
  const Navbar({
    super.key,
    this.onMenuClick,
    required this.username,
    this.avatar,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: child ??
                PopupMenuButton(
                  offset: const Offset(0, 55),
                  child: Row(
                    children: [
                      UsernameText(text: username),
                      const SizedBox(width: 5),
                      ProfileAvatar(avatar: avatar)
                    ],
                  ),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            constraints: const BoxConstraints(minWidth: 180),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ProfileAvatar(avatar: avatar, radius: 40),
                                UsernameText(text: username, visible: true),
                              ],
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading:
                              const Icon(Icons.password, color: Colors.grey),
                          title: const Text("Change Password"),
                          onTap: () {},
                        ),
                      ),
                      const PopupMenuItem(
                          child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: Text("Logout"),
                        // onTap: () => context.go("/auth"),
                      ))
                    ];
                  },
                ),
          )
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final double? radius;
  final Widget? avatar;
  const ProfileAvatar({super.key, this.avatar, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 20.0,
      foregroundColor: Colors.blue,
      child: Center(
        child: avatar ??
            Icon(
              Icons.person,
              size: radius ?? 30,
            ),
      ),
    );
  }
}

class UsernameText extends StatelessWidget {
  final bool? visible;
  final String text;
  const UsernameText({super.key, required this.text, this.visible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible ?? Responsive.sidebarOpen,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: MainColor.textDefault,
        ),
      ),
    );
  }
}
