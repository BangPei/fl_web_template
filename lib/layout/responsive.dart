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

  static sidebarWithControll(double sc) {
    if (sc != _screen) {
      if (sc <= large) {
        sidebarWidth = 0;
        textScaleFactor = 0;
      } else {
        sidebarWidth = 250;
        textScaleFactor = 1;
      }
      sidebarOpen = (sc < small) ? false : true;
      _screen = sc;
    }
  }

  static sidebarClick(double sc) {
    sidebarWidth = sidebarWidth == 250 ? 0 : 250;
  }
}
