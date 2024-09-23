import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import 'pageHeader.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  bool _isCollapsed = false;

  void _toggleDrawer() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  static const double _collapsedWidth = 100;
  static const double _expandedWidth = 250;
  static const Duration _animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;
    final double drawerWidth = _isCollapsed ? _collapsedWidth : _expandedWidth;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 242, 242),
      drawer: !isLargeScreen
          ? CustomDrawer(isCollapsed: _isCollapsed, onToggleDrawer: _toggleDrawer)
          : null,
      body: Stack(
        children: [
          if (isLargeScreen)
            AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left: 0,
              width: drawerWidth,
              child: CustomDrawer(
                isCollapsed: _isCollapsed,
                onToggleDrawer: _toggleDrawer,
              ),
            ),
          AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isLargeScreen ? drawerWidth - 30 : 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    Text('Contenu de la page'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: isLargeScreen ? drawerWidth - 30 : 0,
            right: 0,
            child: const PageHeader(),
          ),
          if (!isLargeScreen)
            Positioned(
              top: 20,
              left: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
        ],
      ),
    );
  }
}
