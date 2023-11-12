import 'package:flutter/material.dart';
import 'package:myportfolio/Views/DesktopView.dart';
import 'package:myportfolio/Views/MobileView.dart';
import 'package:myportfolio/Views/TabView.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mukilan\'s PortFolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          // Define the breakpoints for desktop and tablet
          const double desktopBreakpoint = 900;
          const double tabletBreakpoint = 600;

          if (constraints.maxWidth >= desktopBreakpoint) {
            return const DesktopView();
          } else if (constraints.maxWidth >= tabletBreakpoint) {
            return const TabView();
          } else {
            return const MobileView();
          }
        },
      ),
    );
  }
}
