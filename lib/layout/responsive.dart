import 'package:fl_web_template/layout/widget/bottom_dialog.dart';
import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  static const double small = 576;
  static const double medium = 768;
  static const double large = 992;
  static const double extraLarge = 1200;
  static double sidebarWidth = 250;
  static double textScaleFactor = 1;
  static bool sidebarOpen = true;
  static double _screen = 0;
  static bool _isDialogOpen = false;

  static sidebarWithControll(BuildContext context, double sc) {
    if (sc != _screen) {
      if (sc <= large) {
        sidebarWidth = 0;
        textScaleFactor = 0;
      } else {
        sidebarWidth = 250;
        textScaleFactor = 1;
      }
      sidebarOpen = (sc < small) ? false : true;
      if (_isDialogOpen) {
        Navigator.pop(context);
        _isDialogOpen = false;
      }
      _screen = sc;
    }
  }

  static sidebarClick(BuildContext context, double sc) {
    if (sc > small) {
      sidebarWidth = sidebarWidth == 250 ? 0 : 250;
      if (_isDialogOpen) {
        Navigator.pop(context);
        _isDialogOpen = false;
      }
    } else {
      _isDialogOpen = true;
      BottomDialog.show(context, onPop: () {
        Navigator.pop(context);
        _isDialogOpen = false;
      });
    }
  }
}
